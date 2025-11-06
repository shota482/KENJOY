import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/navigation/bottumNavigation.dart';
import '../features/record/create/RecordCreateScreen.dart';
import '../screens/homeScreeen.dart';
import '../screens/page1.dart';
import '../screens/regionScreen.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const AppNavigationBar(),
        );
      },
      routes: [
        GoRoute(
          path: HomePage.path,
          name: 'HomePage',
          pageBuilder: (BuildContext context, GoRouterState? state) =>
              MaterialPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: Page1.path,
          pageBuilder: (BuildContext context, GoRouterState? state) =>
              MaterialPage(
            child: Page1(),
          ),
        ),
        GoRoute(
          path: RecordCreatePage.path,
          pageBuilder: (BuildContext context, GoRouterState? state) =>
              MaterialPage(
            child: RecordCreatePage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: RegionListPage.path,
      name: 'RegionSelect',
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          MaterialPage(
            child: RegionListPage(),
          ),
    ),],
);
