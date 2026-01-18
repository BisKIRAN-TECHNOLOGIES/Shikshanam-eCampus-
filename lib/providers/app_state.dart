import 'package:flutter/material.dart';

enum StudentPage {
  home,
  classes,
  library,
  tests,
  analytics,
  profile,
  notifications,
  testTaking,
  testResults,
  videoPlayer,
  notesViewer,
  leaderboard,
  store,
  myCourses,
  contentDetail,
  gorkhapatra,
  subjectCategory,
}

class AppState extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isAdminView = false;
  StudentPage _currentPage = StudentPage.home;
  dynamic _pageData;
  int _notificationCount = 3;

  bool get isDarkMode => _isDarkMode;
  bool get isAdminView => _isAdminView;
  StudentPage get currentPage => _currentPage;
  dynamic get pageData => _pageData;
  int get notificationCount => _notificationCount;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleView() {
    _isAdminView = !_isAdminView;
    notifyListeners();
  }

  void navigateTo(StudentPage page, [dynamic data]) {
    _currentPage = page;
    _pageData = data;
    notifyListeners();
  }

  void setNotificationCount(int count) {
    _notificationCount = count;
    notifyListeners();
  }

  bool get showBottomNav {
    return true;
  }
}
