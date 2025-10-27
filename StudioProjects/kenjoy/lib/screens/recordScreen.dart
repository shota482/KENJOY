import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'regionScreen.dart';
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);
  static const path = '/page1';
  @override
  _Page1State createState() => _Page1State();
}
class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Column(children:[
        TextButton(
          onPressed: () => GoRouter.of(context).push(RegionListPage.path),
          child: Text('Go to Region'),
        ),
        // ここに、「遷移元のデータ追加分」を追加
      ]),
    );
  }
}