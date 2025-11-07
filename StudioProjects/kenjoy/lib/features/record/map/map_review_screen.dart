import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:kenjoy/models/record.dart';

import 'map_review_widgets.dart';

class MapReviewPage extends StatefulWidget {
  const MapReviewPage({super.key});

  static const path = '/map/review';

  @override
  State<MapReviewPage> createState() => _MapReviewPageState();
}

class _MapReviewPageState extends State<MapReviewPage> {
  String selectedMapType = 'my';
  final mapTypes = ["my", '家族', '恋人'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マップ画面'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedMapType,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                dropdownColor: Colors.grey[10],
                style: const TextStyle(color: Colors.grey, fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    selectedMapType = value!;
                  });
                },
                items: mapTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(type, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                }).toList(),
                selectedItemBuilder: (context) {
                  // AppBar 上に表示される部分
                  return mapTypes.map((type) {
                    return Row(
                      children: [
                        const SizedBox(width: 4),
                        Text(type, style: const TextStyle(color: Colors.grey)),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ],
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
                  onTap: () {},
                  record: RecordModel(
                      title: '誕生日',
                      startDate: DateTime(2025, 10, 2),
                      prefs: ["福岡", "熊本"],tags: ["温泉","カフェ巡り"]),
                ),
                RecordSummaryCard(
                  onTap: () {},
                  record: RecordModel(
                      title: '誕生日',
                      startDate: DateTime(2025, 10, 2),
                      prefs: ["福岡", "熊本"]),
                ),
                RecordSummaryCard(
                  onTap: () {},
                  record: RecordModel(
                      title: '誕生日',
                      startDate: DateTime(2025, 10, 2),
                      prefs: ["福岡", "熊本"]),
                ),
                RecordSummaryCard(
                  onTap: () {},
                  record: RecordModel(
                      title: '誕生日',
                      startDate: DateTime(2025, 10, 2),
                      prefs: ["福岡", "熊本"]),
                ),
                RecordSummaryCard(
                  onTap: () {},
                  record: RecordModel(
                      title: '誕生日',
                      startDate: DateTime(2025, 10, 2),
                      prefs: ["福岡", "熊本"]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
