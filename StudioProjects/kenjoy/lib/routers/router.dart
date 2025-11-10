import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/features/record/map/map_review_screen.dart';

import '../core/navigation/bottum_navigation.dart';
import '../features/record/create/record_create_screen.dart';
import '../features/record/view/record_listview_screen.dart';
import '../screens/home_screen.dart';
import '../screens/page1.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                  backgroundColor: Colors.orange.shade100,
                  indicatorColor: Colors.orange.shade200,
              ),
              child: const AppNavigationBar(),
            ));
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
        GoRoute(
          path: MapReviewPage.path,
          pageBuilder: (BuildContext context, GoRouterState? state) =>
              MaterialPage(
                child: MapReviewPage(),
              ),
        ),
        GoRoute(
          path: RecordListPage.path,
          pageBuilder: (BuildContext context, GoRouterState? state) =>
              MaterialPage(
                child: RecordListPage(),
              ),
        ),
      ],
    ),
  ],
);
