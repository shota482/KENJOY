import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/recordScreen.dart';
import '../screens/regionScreen.dart';

final goRouter = GoRouter(
  initialLocation: RegionListPage.path,
  routes: [
    GoRoute(
      path: RegionListPage.path,
      name: 'initial',
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
  ],
);
