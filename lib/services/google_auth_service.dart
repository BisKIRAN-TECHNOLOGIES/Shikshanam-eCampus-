import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static const String _clientId =
      "462381335611-65kl9i78fdss06lvq6cof6mqssqvt6pi.apps.googleusercontent.com";
  static const String _serverClientId =
      "462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com";

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSubscription;

  /// Initialize Google Sign-In
  Future<void> initialize({
    required Function(GoogleSignInAuthenticationEvent) onAuthenticationEvent,
    required Function(Object) onAuthenticationError,
  }) async {
    try {
      await _googleSignIn.initialize(
        clientId: _clientId,
        serverClientId: _serverClientId,
      );

      // Set up the authentication event listener
      _authSubscription = _googleSignIn.authenticationEvents.listen(
        onAuthenticationEvent,
        onError: onAuthenticationError,
      );

      debugPrint('Google Sign-In initialized successfully');
    } catch (error) {
      debugPrint('Google Sign-In initialization failed: $error');
      rethrow;
    }
  }

  /// Authenticate with Google
  Future<void> authenticate() async {
    try {
      await _googleSignIn.authenticate();
    } catch (error) {
      debugPrint('Google Sign-In authentication error: $error');
      rethrow;
    }
  }

  /// Get user information after successful authentication
  Future<Map<String, dynamic>> getUserInfo(
    GoogleSignInAuthenticationEvent event,
  ) async {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      final GoogleSignInAccount user = event.user;
      final GoogleSignInAuthentication auth = user.authentication;
      final String? idToken = auth.idToken;

      return {
        'displayName': user.displayName ?? 'Unknown',
        'email': user.email,
        'id': user.id,
        'photoUrl': user.photoUrl,
        'idToken': idToken,
        'authStatus': 'Authenticated',
        'authTime': DateTime.now().toIso8601String(),
      };
    }

    throw Exception('Invalid authentication event');
  }

  /// Check if Google Sign-In is supported on this platform
  bool get supportsAuthentication => _googleSignIn.supportsAuthenticate();

  /// Sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      debugPrint('User signed out successfully');
    } catch (error) {
      debugPrint('Sign out error: $error');
      rethrow;
    }
  }

  /// Disconnect
  Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
      _authSubscription?.cancel();
      debugPrint('Google Sign-In disconnected');
    } catch (error) {
      debugPrint('Disconnect error: $error');
      rethrow;
    }
  }
}
