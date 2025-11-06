import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/screens/page1.dart';

import '../features/record/create/RecordCreateScreen.dart';
import 'regionScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/kenjoy.svg',
              semanticsLabel: 'logo',
              width: 300,
              height: 300,
            ),
          ),
          Align(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () => GoRouter.of(context).push(RegionListPage.path),
                child: Text('Go to Region'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => GoRouter.of(context).push(Page1.path),
                child: Text('Page1'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => GoRouter.of(context).push(RecordCreatePage.path),
                child: Text('recordCreatePage'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
