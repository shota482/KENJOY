import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import 'mapReviewWidgets.dart';

class MapReviewPage extends StatelessWidget {
  const MapReviewPage({super.key});

  static const path = '/map/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MapReview'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/japan_map.svg',
                  semanticsLabel: 'Japan map',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain, // ← 見切れ防止
                ),
              ),
            ),
            const Divider(),

            Expanded(
              child: ListView(
                children: [
                  RecordSummaryCard(
                    title: '誕生日',
                    date: DateTime(2025, 10, 2),
                    pref: "福岡",
                    imageUrl: null,
                    onTap: () {},),
                  RecordSummaryCard(
                    title: '誕生日',
                    date: DateTime(2025, 10, 2),
                    pref: "福岡",
                    imageUrl: null,
                    onTap: () {},),
                  RecordSummaryCard(
                    title: '誕生日',
                    date: DateTime(2025, 10, 2),
                    pref: "福岡",
                    imageUrl: null,
                    onTap: () {},),
                  RecordSummaryCard(
                    title: '誕生日',
                    date: DateTime(2025, 10, 2),
                    pref: "福岡",
                    imageUrl: null,
                    onTap: () {},),
                  RecordSummaryCard(
                    title: '誕生日',
                    date: DateTime(2025, 10, 2),
                    pref: "福岡",
                    imageUrl: null,
                    onTap: () {},),
                ],
              ),
            ),
          ],
        )
    );
  }
}