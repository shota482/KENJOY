import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenjoy/features/record/create/record_create_screen.dart';
import 'package:kenjoy/features/record/view/record_listview_state.dart';


class RecordListPage extends ConsumerWidget {
  const RecordListPage({super.key});
  static const path = '/record/list_view';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(recordListProvider); // 一覧データを取得
    final notifier = ref.read(recordListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('記録一覧'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              notifier.clear(); // 全削除
            },
          )
        ],
      ),
      body: records.isEmpty
          ? const Center(child: Text('記録がまだありません'))
          : ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              title: Text(record.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '開始日: ${record.startDate.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  if (record.finDate != null)
                    Text('終了日: ${record.finDate!.toLocal().toString().split(' ')[0]}',
                        style: const TextStyle(fontSize: 12)),
                  if (record.prefs.isNotEmpty)
                    Wrap(
                      spacing: 6,
                      children: record.prefs
                          .map((pref) => Chip(
                        label: Text(pref),
                        backgroundColor: Colors.orange.shade50,
                      ))
                          .toList(),
                    ),
                  if (record.tags.isNotEmpty)
                    Wrap(
                      spacing: 6,
                      children: record.tags
                          .map((tag) => Chip(
                        label: Text('#$tag'),
                        backgroundColor: Colors.blue.shade50,
                      ))
                          .toList(),
                    ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => notifier.removeRecord(record),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() =>  GoRouter.of(context).push(RecordCreatePage.path),
        child: const Icon(Icons.add),
      ),
    );
  }
}
