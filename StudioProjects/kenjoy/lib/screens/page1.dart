import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'region_screen.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});
  static const path = '/RecordList';
  @override
  Page1State createState() => Page1State();
}
class Page1State extends State<Page1> {
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