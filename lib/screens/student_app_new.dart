import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/app_background.dart';
import 'student/home_screen_new.dart';
import 'student/study_library_screen.dart';
import 'student/practice_tests_screen.dart';
import 'student/zoom_classes_screen.dart';
import 'student/analytics_screen.dart';
import 'student/profile_screen.dart';
import 'student/leaderboard_screen.dart';
import 'student/store_screen.dart';
import 'student/my_courses_screen.dart';
import 'student/content_detail_screen.dart';
import 'student/notifications_screen.dart';
import 'student/test_taking_screen.dart';
import 'student/test_results_screen.dart';
import 'student/video_player_screen.dart';
import 'student/notes_viewer_screen.dart';
import 'student/gorkhapatra_screen.dart';
import 'student/subject_category_screen.dart';
import '../providers/app_state.dart';
import 'package:provider/provider.dart';

class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  State<StudentApp> createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isNavBarVisible = true;
  AnimationController? _navBarAnimController;
  Animation<Offset>? _navBarSlideAnimation;

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_outlined, 'label': 'Home'},
    {'icon': Icons.videocam_outlined, 'label': 'Classes'},
    {'icon': Icons.library_books_outlined, 'label': 'Library'},
    {'icon': Icons.assignment_outlined, 'label': 'Tests'},
    {'icon': Icons.bar_chart_outlined, 'label': 'Stats'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  final List<Widget> _screens = [
    const HomeScreen(),
    const ZoomClassesScreen(),
    const StudyLibraryScreen(),
    const PracticeTestsScreen(),
    const AnalyticsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _navBarAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _navBarSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(CurvedAnimation(
      parent: _navBarAnimController!,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _navBarAnimController?.dispose();
    super.dispose();
  }

  void _handleScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      // User is scrolling
      if (notification.scrollDelta != null && notification.scrollDelta! > 0) {
        // Scrolling down - hide navbar
        if (_isNavBarVisible) {
          setState(() => _isNavBarVisible = false);
          _navBarAnimController.forward();
        }
      } else if (notification.scrollDelta != null &&
          notification.scrollDelta! < 0) {
        // Scrolling up - show navbar
        if (!_isNavBarVisible) {
          setState(() => _isNavBarVisible = true);
          _navBarAnimController.reverse();
        }
      }
    } else if (notification is ScrollEndNotification) {
      // Scrolling stopped - show navbar
      if (!_isNavBarVisible) {
        setState(() => _isNavBarVisible = true);
        _navBarAnimController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleScroll(notification);
          return false;
        },
        child: AppBackground(
          child: Consumer<AppState>(
            builder: (context, appState, _) {
              // Handle internal screens
              switch (appState.currentPage) {
                case StudentPage.leaderboard:
                  return const LeaderboardScreen();
                case StudentPage.store:
                  return const StoreScreen();
                case StudentPage.myCourses:
                  return const MyCoursesScreen();
                case StudentPage.contentDetail:
                  return ContentDetailScreen(
                    title: appState.pageData?['title'] ?? 'Content',
                    type: appState.pageData?['type'] ?? 'GK',
                  );
                case StudentPage.notifications:
                  return const NotificationsScreen();
                case StudentPage.testTaking:
                  return const TestTakingScreen();
                case StudentPage.testResults:
                  return const TestResultsScreen();
                case StudentPage.videoPlayer:
                  return const VideoPlayerScreen();
                case StudentPage.notesViewer:
                  return const NotesViewerScreen();
                case StudentPage.gorkhapatra:
                  return const GorkhapatraScreen();
                case StudentPage.subjectCategory:
                  return const SubjectCategoryScreen();
                default:
                  break;
              }

              // Return main navigation screens
              return _screens[_selectedIndex];
            },
          ),
        ),
      ),
      bottomNavigationBar: SlideTransition(
        position: _navBarSlideAnimation,
        child: _buildGlassmorphismNavBar(isDark),
      ),
    );
  }

  Widget _buildGlassmorphismNavBar(bool isDark) {
    final tealColor = const Color(0xFF14B8A6);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : const Color(0xFF2563eb).withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0a0e27).withOpacity(0.72)
                  : Colors.white.withOpacity(0.95),
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? Colors.white.withOpacity(0.15)
                      : const Color(0xFF2563eb).withOpacity(0.12),
                  width: 1.5,
                ),
              ),
              boxShadow: isDark
                  ? null
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(_navItems.length, (index) {
                    final isSelected = _selectedIndex == index;
                    final item = _navItems[index];

                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: isSelected
                              ? tealColor.withOpacity(isDark ? 0.22 : 0.12)
                              : Colors.transparent,
                          border: isSelected
                              ? Border.all(
                                  color:
                                      tealColor.withOpacity(isDark ? 0.4 : 0.3),
                                  width: 1.2,
                                )
                              : null,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              item['icon'],
                              color: isSelected
                                  ? tealColor
                                  : isDark
                                      ? Colors.grey[400]
                                      : Colors.grey[600],
                              size: 24,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item['label'],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isSelected
                                    ? tealColor
                                    : isDark
                                        ? Colors.grey[500]
                                        : Colors.grey[700],
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
