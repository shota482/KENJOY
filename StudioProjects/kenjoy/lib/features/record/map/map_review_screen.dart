import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:kenjoy/models/record.dart';

import '../view/record_listview_state.dart';
import 'map_review_widgets.dart';

class MapReviewPage extends ConsumerWidget {
  const MapReviewPage({super.key});

  static const path = '/map/review';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(recordListProvider); // 一覧データを取得
    final notifier = ref.read(recordListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('マップ画面'),
      ),
      body: SafeArea(
        child: Column(children: [
          ExpansionTile(
            title: const Text('マップ'),
            initiallyExpanded: true,
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
            ],
          ),

          Expanded(
            child: records.isEmpty
                ? const Center(child: Text('記録がまだありません'))
                : ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final record = records[index];
                      return RecordSummaryCard(
                        onTap: () {},
                        record: RecordModel(
                            title: record.title,
                            startDate: record.startDate,
                            prefs: record.prefs,
                            picUrls: record.picUrls,
                            tags: record.tags),
                      );
                    }),
          ),
        ]),
      ),
    );
  }
}
