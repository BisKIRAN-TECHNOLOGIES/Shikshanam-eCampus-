import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/app_state.dart';
import 'screens/student_app_new.dart';
import 'screens/admin_dashboard.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return MaterialApp(
          // Branding updated as requested
          title: 'Shikshanam eCampus | Powered by BisKIRAN',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: appState.isAdminView ? const AdminDashboard() : const StudentApp(),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          appState.isAdminView 
            ? const AdminDashboard() 
            : const StudentApp(),
          
          // Control Panel
          Positioned(
            top: 16,
            right: 16,
            child: Row(
              children: [
                // Dark Mode Toggle
                Material(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  elevation: 2,
                  child: InkWell(
                    onTap: () => appState.toggleDarkMode(),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        appState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        color: appState.isDarkMode 
                          ? const Color(0xFFf97316) 
                          : const Color(0xFF2563eb),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // View Toggle
                Material(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  elevation: 2,
                  child: InkWell(
                    onTap: () => appState.toggleView(),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            appState.isAdminView 
                              ? Icons.phone_android 
                              : Icons.desktop_windows,
                            color: appState.isAdminView 
                              ? const Color(0xFFf97316) 
                              : const Color(0xFF2563eb),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            appState.isAdminView ? 'Student' : 'Admin',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
