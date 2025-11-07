import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/features/record/create/record_create_screen.dart';
import 'package:kenjoy/features/record/view/record_listview_screen.dart';


import '../../features/record/map/map_review_screen.dart';
import '../../screens/home_screen.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int selectedIndex = switch (true) {
      _ when location.startsWith(MapReviewPage.path) => 1,
      _ when location.startsWith(RecordCreatePage.path) => 2,
      _ when location.startsWith(RecordListPage.path) => 3,
    //TODO replace account path
      _ when location.startsWith(RecordCreatePage.path) => 4,
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
          case 3:
            context.go(RecordListPage.path);
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
