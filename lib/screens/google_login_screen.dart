import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/google_auth_service.dart';

class GoogleLoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const GoogleLoginScreen({
    super.key,
    required this.onLoginSuccess,
  });

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen>
    with SingleTickerProviderStateMixin {
  final GoogleSignInService _authService = GoogleSignInService();
  GoogleSignInAccount? _currentUser;
  String _errorMessage = '';
  bool _showDebugInfo = false;

  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _animationController.forward();
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    try {
      await _authService.initialize(
        onEvent: (event) {
          if (!mounted) return;
          setState(() {
            switch (event) {
              case GoogleSignInAuthenticationEventSignIn():
                _currentUser = event.user;
                _errorMessage = '';
                debugPrint('✅ SUCCESSFUL SIGN-IN: ${event.user.email}');
                // Auto-login if user already signed in
                if (_currentUser != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) widget.onLoginSuccess();
                  });
                }
                break;
              case GoogleSignInAuthenticationEventSignOut():
                _currentUser = null;
                _errorMessage = '';
                debugPrint('🚪 USER SIGNED OUT');
                break;
            }
          });
        },
        onError: (error) {
          debugPrint('🚨 AUTHENTICATION ERROR: $error');
          if (!mounted) return;
          setState(() {
            final errorStr = error.toString();
            if (errorStr.contains('reauth failed') ||
                errorStr.contains('Account reauth failed')) {
              _errorMessage =
                  'Account verification failed. Please check:\n\n• Google Console credentials\n• SHA-1 fingerprint\n• Internet connection\n\nTap "Show Debug Info" below for details.';
            } else if (errorStr.contains('canceled')) {
              _errorMessage = ''; // Don't show error for cancellation
            } else {
              _errorMessage =
                  'Authentication error. Please check your internet connection and try again.';
            }
          });
        },
      );

      debugPrint('🔧 GOOGLE SIGN-IN CONFIGURATION:');
      debugPrint(
          'Client ID: 462381335611-65kl9i78fdss06lvq6cof6mqssqvt6pi.apps.googleusercontent.com');
      debugPrint(
          'Server Client ID: 462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com');
      debugPrint('Platform: ${Theme.of(context).platform}');
    } catch (e) {
      debugPrint('🚨 INITIALIZATION ERROR: $e');
      setState(() {
        _errorMessage = 'Failed to initialize authentication';
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // ================= GOOGLE SIGN IN =================

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = ''; // Clear previous errors
    });

    try {
      await _authService.authenticate();

      // The authentication event will handle the success case
      // If we reach here without error, the event handler will trigger navigation
    } catch (e) {
      final errorStr = e.toString();

      if (errorStr.contains('canceled')) {
        // User cancelled - don't show error
        debugPrint('User cancelled sign-in');
      } else if (errorStr.contains('reauth failed') ||
          errorStr.contains('Account reauth failed')) {
        _showError(
            'Account verification failed. This might be due to:\n\n• Outdated Google Play Services\n• App configuration issue\n• Network connectivity\n\nPlease try again or restart the app.');
      } else if (errorStr.contains('network')) {
        _showError(
            'Network error. Please check your internet connection and try again.');
      } else {
        _showError(
            'Sign-in failed. Please try again or contact support if this issue persists.');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF1a1a2e),
                    const Color(0xFF16213e),
                    const Color(0xFF0f3460),
                  ]
                : [
                    const Color(0xFF667eea),
                    const Color(0xFF764ba2),
                    const Color(0xFFf093fb),
                  ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 30,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.school_rounded,
                              size: 60,
                              color: isDark
                                  ? const Color(0xFF667eea)
                                  : const Color(0xFF764ba2),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Shikshanam eCampus',
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Powered by BisKIRAN Technologies',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildGoogleSignInButton(isDark),
                  ),
                  const SizedBox(height: 32),

                  // Features Section
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildFeaturesSection(isDark),
                  ),

                  const SizedBox(height: 24),

                  // Footer
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildFooter(),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(bool isDark) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _isLoading ? null : _handleGoogleSignIn,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(
                      isDark
                          ? const Color(0xFF667eea)
                          : const Color(0xFF764ba2),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png',
                      height: 24,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.account_circle,
                          size: 24,
                          color: Color(0xFF4285f4),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Continue with Google',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1f2937),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(bool isDark) {
    final features = [
      {
        'icon': Icons.quiz_outlined,
        'title': 'Practice Tests',
        'subtitle': 'Mock exams & quizzes'
      },
      {
        'icon': Icons.video_library_outlined,
        'title': 'Video Lessons',
        'subtitle': 'Expert-led tutorials'
      },
      {
        'icon': Icons.analytics_outlined,
        'title': 'Performance Analytics',
        'subtitle': 'Track your progress'
      },
    ];

    return Column(
      children: [
        Text(
          'Why Choose Shikshanam eCampus?',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        feature['icon'] as IconData,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feature['title'] as String,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            feature['subtitle'] as String,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text(
          '🇳🇵 Proudly Made in Nepal',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Empowering Nepal\'s Future Civil Servants',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 16),
        if (_errorMessage.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.red.withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red[300],
                  size: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  _errorMessage,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.red[300],
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: _isLoading
                            ? null
                            : () {
                                setState(() {
                                  _errorMessage = '';
                                });
                                _handleGoogleSignIn();
                              },
                        icon: Icon(
                          Icons.refresh,
                          size: 16,
                          color: Colors.red[300],
                        ),
                        label: Text(
                          'Try Again',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.red[300],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          backgroundColor: Colors.red.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Colors.red.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _showDebugInfo = !_showDebugInfo;
                          });
                        },
                        icon: Icon(
                          _showDebugInfo
                              ? Icons.visibility_off
                              : Icons.bug_report,
                          size: 16,
                          color: Colors.blue[300],
                        ),
                        label: Text(
                          _showDebugInfo ? 'Hide Info' : 'Debug Info',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[300],
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Colors.blue.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_showDebugInfo) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue[300],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Current Configuration',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[300],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildDebugItem('Android Client ID',
                      '462381335611-65kl9i78fdss06lvq6cof6mqssqvt6pi.apps.googleusercontent.com'),
                  _buildDebugItem('Web Client ID (Server)',
                      '462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com'),
                  _buildDebugItem('SHA-1 Fingerprint',
                      'B8:00:43:CD:C2:CE:CD:6C:9D:D2:98:C8:95:4B:75:A3:A3:76:31:84'),
                  _buildDebugItem('Package Name', 'com.example.nepal_loksewa'),
                  _buildDebugItem('Platform', Theme.of(context).platform.name),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '✅ SHA-1 Already Added - Check Other Issues:',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.green[200],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Since SHA-1 is added, try these additional fixes:',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.green[200],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Additional troubleshooting:',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[200],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '1. Wait 10-15 minutes for Google changes to propagate\n2. Check OAuth consent screen is published (not in testing)\n3. Verify package name in android/app/build.gradle\n4. Clear Google Play Services cache\n5. Update Google Play Services on device\n6. Try: adb shell pm clear com.google.android.gms',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Colors.blue[200],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ],
    );
  }

  Widget _buildDebugItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.blue[200],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              value,
              style: GoogleFonts.aDLaMDisplay(
                fontSize: 10,
                color: Colors.blue[100],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
