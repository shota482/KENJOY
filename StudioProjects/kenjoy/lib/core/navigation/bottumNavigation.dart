import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/features/record/create/RecordCreateScreen.dart';


import '../../screens/homeScreeen.dart';
import '../../screens/page1.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int selectedIndex = switch (true) {
      _ when location.startsWith(Page1.path) => 1,
      _ when location.startsWith(RecordCreatePage.path) => 2,
      _ => 0
    };

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index){
        switch (index){
          case 0:
            context.go(HomePage.path);
            break;
          case 1:
            context.go(Page1.path);
            break;
          case 2:
            context.go(RecordCreatePage.path);
            break;
        }
      },
      destinations: const[
        NavigationDestination(icon: Icon(Icons.home), label: 'ホーム'),
        NavigationDestination(icon: Icon(Icons.map), label: '地図'),
        NavigationDestination(icon: Icon(Icons.add), label: '作成'),
      ],
    );
  }
}
