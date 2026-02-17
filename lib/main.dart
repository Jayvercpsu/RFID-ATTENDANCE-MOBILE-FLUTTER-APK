import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/report_screen.dart';

void main() {
  runApp(const RFIDAttendanceApp());
}

class RFIDAttendanceApp extends StatelessWidget {
  const RFIDAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parent Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B82F6)),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  String _currentScreen = 'login';
  String _parentName = '';
  String _childName = '';
  String _childId = '';

  void _handleLogin(String parentId) {
    setState(() {
      _parentName = 'Sarah Johnson';
      _childName = 'Emily Johnson';
      _childId = 'S-2024-5678';
      _currentScreen = 'dashboard';
    });
  }

  void _handleLogout() {
    setState(() {
      _parentName = '';
      _childName = '';
      _childId = '';
      _currentScreen = 'login';
    });
  }

  void _handleNavigate(String screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 'login':
        return LoginScreen(onLogin: _handleLogin);
      case 'dashboard':
        return DashboardScreen(
          parentName: _parentName,
          childName: _childName,
          childId: _childId,
          onNavigate: _handleNavigate,
          currentScreen: _currentScreen,
        );
      case 'notifications':
        return NotificationsScreen(
          childName: _childName,
          onNavigate: _handleNavigate,
          currentScreen: _currentScreen,
        );
      case 'profile':
        return ProfileScreen(
          parentName: _parentName,
          childName: _childName,
          childId: _childId,
          onNavigate: _handleNavigate,
          onLogout: _handleLogout,
          currentScreen: _currentScreen,
        );
      case 'report':
        return ReportScreen(
          childName: _childName,
          childId: _childId,
          onNavigate: _handleNavigate,
          currentScreen: _currentScreen,
        );
      default:
        return LoginScreen(onLogin: _handleLogin);
    }
  }
}