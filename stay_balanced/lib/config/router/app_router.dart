// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stay_balanced/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import  'package:stay_balanced/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  debugLogDiagnostics: true,
  routes: [
    // ====================== RUTAS FUERA DEL BOTTOM NAV ======================
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // ====================== SHELL ROUTE (Bottom Navigation) ======================
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        // Dashboard = HomeScreen
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/expenses',
          builder: (context, state) => const ExpensesScreen(),
        ),
        GoRoute(
          path: '/goals',
          builder: (context, state) => const GoalsScreen(),
        ),
        GoRoute(
          path: '/ranking',
          builder: (context, state) => const RankingScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);