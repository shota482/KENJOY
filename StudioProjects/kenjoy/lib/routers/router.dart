import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/record/create/RecordCreateScreen.dart';
import '../screens/homeScreeen.dart';
import '../screens/recordScreen.dart';
import '../screens/regionScreen.dart';

final goRouter = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      path: HomePage.path,
      name: 'HomePage',
      pageBuilder: (BuildContext context, GoRouterState? state) => MaterialPage(
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: RegionListPage.path,
      name: 'RegionSelect',
      pageBuilder: (BuildContext context, GoRouterState? state) => MaterialPage(
        child: RegionListPage(),
      ),
    ),
    GoRoute(
      path: Page1.path,
      pageBuilder: (BuildContext context, GoRouterState? state) => MaterialPage(
        child: Page1(),
      ),
    ),
    GoRoute(
      path: RecordCreatePage.path,
      pageBuilder: (BuildContext context, GoRouterState? state) => MaterialPage(
        child: RecordCreatePage(),
      ),
    ),
  ],
);
