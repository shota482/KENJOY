import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/screens/recordScreen.dart';

import 'regionScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const path = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                onPressed: () {},
                child: Text('Page2(null)'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
