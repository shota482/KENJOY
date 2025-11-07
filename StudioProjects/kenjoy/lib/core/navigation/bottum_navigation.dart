import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/features/record/create/record_create_screen.dart';


import '../../features/record/map/mapReviewScreen.dart';
import '../../screens/home_screen.dart';
import '../../screens/page1.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int selectedIndex = switch (true) {
      _ when location.startsWith(MapReviewPage.path) => 1,
      _ when location.startsWith(RecordCreatePage.path) => 2,
      _ => 0
    };

    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index){
        switch (index){
          case 0:
            context.go(HomePage.path);
            break;
          case 1:
            context.go(MapReviewPage.path);
            break;
          case 2:
            context.go(RecordCreatePage.path);
            break;
        }
      },
      destinations: const[
        NavigationDestination(icon: Icon(Icons.home), label: 'ホーム'),
        NavigationDestination(icon: Icon(Icons.map), label: 'map'),
        NavigationDestination(icon: Icon(Icons.add), label: 'create'),
        NavigationDestination(icon: Icon(Icons.format_list_bulleted), label: 'trip'),
        NavigationDestination(icon: Icon(Icons.account_circle), label: 'Mypage'),
      ],
    );
  }
}
