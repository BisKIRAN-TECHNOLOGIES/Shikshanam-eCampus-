import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Lightweight, self-contained Google Sign-In service tailored to this app.
///
/// - Provides `initialize` to set client IDs and attach event handlers.
/// - Exposes `authenticate`, `signIn`, `signOut`, `disconnect`.
/// - Avoids external dependencies so it compiles in this workspace.
class GoogleSignInService {
  GoogleSignInService();

  static const String androidClientId =
      '462381335611-65kl9i78fdss06lvq6cof6mqssqvt6pi.apps.googleusercontent.com';
  static const String webClientId =
      '462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com';

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSubscription;
  GoogleSignInAccount? _lastAccount;
  bool _initialized = false;

  /// Initialize the service and attach event handlers.
  ///
  /// Call before attempting user-triggered authentication flows. `onEvent`
  /// receives authentication events (sign-in/sign-out). `onError` receives
  /// authentication errors.
  Future<void> initialize({
    String? clientId,
    String? serverClientId,
    required void Function(GoogleSignInAuthenticationEvent) onEvent,
    required void Function(Object) onError,
  }) async {
    if (_initialized) return;

    try {
      await _googleSignIn.initialize(
        clientId: clientId ?? (kIsWeb ? webClientId : androidClientId),
        serverClientId: serverClientId ?? webClientId,
      );

      _authSubscription = _googleSignIn.authenticationEvents.listen(
        (event) {
          // cache latest signed-in account for quick access
          if (event is GoogleSignInAuthenticationEventSignIn) {
            _lastAccount = event.user;
          } else if (event is GoogleSignInAuthenticationEventSignOut) {
            _lastAccount = null;
          }
          onEvent(event);
        },
        onError: onError,
      );
      _initialized = true;
      debugPrint('Google Sign-In initialized successfully');
    } catch (e) {
      debugPrint('Google Sign-In initialization failed: $e');
      rethrow;
    }
  }

  /// Trigger the explicit authentication UI flow.
  Future<void> authenticate() async {
    try {
      await _googleSignIn.authenticate();
    } catch (e) {
      debugPrint('Google Sign-In authentication error: $e');
      rethrow;
    }
  }

  /// Convenience explicit sign-in (returns the account or null).
  Future<GoogleSignInAccount?> signIn() async {
    try {
      // Use authenticate() to present auth UI. The authentication event
      // listener (if attached) will receive the resulting sign-in event.
      await _googleSignIn.authenticate();
      return null;
    } catch (e) {
      debugPrint('Google Sign-In signIn error: $e');
      rethrow;
    }
  }

  /// Sign out (does not revoke app access).
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      debugPrint('Google Sign-Out error: $e');
      rethrow;
    }
  }

  /// Disconnect and revoke access.
  Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
      await _authSubscription?.cancel();
      _authSubscription = null;
    } catch (e) {
      debugPrint('Google Disconnect error: $e');
      rethrow;
    }
  }

  /// Returns whether `authenticate()` is supported on the current platform.
  bool get supportsAuthenticate => _googleSignIn.supportsAuthenticate();

  /// Ensure the current user state is refreshed and return it.
  /// Uses `signInSilently()` which returns the current account if already
  /// signed-in without presenting UI.
  /// Return cached last known account (populated from authentication events).
  /// Does not trigger any UI or network authentication attempts.
  Future<GoogleSignInAccount?> getCurrentUser() async {
    return _lastAccount;
  }

  /// Optional helper: construct a lightweight map of user info from an
  /// authentication event.
  Future<Map<String, dynamic>> getUserInfo(
      GoogleSignInAuthenticationEvent event) async {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      final user = event.user;
      final auth = user.authentication;
      return {
        'displayName': user.displayName ?? 'Unknown',
        'email': user.email,
        'id': user.id,
        'photoUrl': user.photoUrl,
        'idToken': auth.idToken,
      };
    }
    throw StateError('Invalid authentication event');
  }
}
