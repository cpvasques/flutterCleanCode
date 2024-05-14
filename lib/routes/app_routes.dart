import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';

class AppRoutes {
  static const String dashboardPage = '/dashboard';

  static final GoRouter router = GoRouter(
    initialLocation: dashboardPage,
    routes: <GoRoute>[
      GoRoute(
        path: dashboardPage,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardPage(),
      ),
    ],
  );
}
