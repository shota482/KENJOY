import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenjoy/features/record/create/record_create_provider.dart';
import '../../../models/record.dart';
import '../view/record_listview_state.dart';

class RecordCreatePage extends ConsumerStatefulWidget {
  const RecordCreatePage({super.key});
  static const path = '/record/create';

  @override
  ConsumerState<RecordCreatePage> createState() => _RecordCreatePageState();
}

class _RecordCreatePageState extends ConsumerState<RecordCreatePage> {
  // 入力フォーム用コントローラ
  final titleController = TextEditingController();
  final textController = TextEditingController();
  final picUrlController = TextEditingController();
  final tagController = TextEditingController();
  final prefController = TextEditingController();

  DateTime? startDate;
  DateTime? finDate;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recordCreateProvider);
    final notifier = ref.read(recordCreateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('記録を作成'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(titleController, 'タイトル'),
            const SizedBox(height: 12),
            _buildDatePicker(context, '開始日', (date) {
              setState(() => startDate = date);
            }),
            _buildDatePicker(context, '終了日', (date) {
              setState(() => finDate = date);
            }),
            const SizedBox(height: 12),
            _buildTextField(textController, '本文（メモなど）', maxLines: 4),
            const SizedBox(height: 12),
            _buildTextField(picUrlController, '画像URL（カンマ区切りで複数可）'),
            const SizedBox(height: 12),
            _buildTextField(prefController, '都道府県（カンマ区切りで複数可）'),
            const SizedBox(height: 12),
            _buildTextField(tagController, 'タグ（カンマ区切りで複数可）'),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                  final record = RecordModel(
                    title: titleController.text.trim(),
                    startDate: startDate ?? DateTime.now(),
                    finDate: finDate,
                    text: textController.text.trim().isEmpty
                        ? null
                        : textController.text.trim(),
                    picUrls: picUrlController.text.isEmpty
                        ? []
                        : picUrlController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList(),
                    prefs: prefController.text.isEmpty
                        ? []
                        : prefController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList(),
                    tags: tagController.text.isEmpty
                        ? []
                        : tagController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList(),
                  );

                  ref
                      .read(recordListProvider.notifier)
                      .addRecord(record);

                  //notifier.createRecord(record);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('記録を作成しました')),
                  );
                },
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('保存'),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '現在のデータ:\n${state.record?.title}\n${state.record?.startDate}\n${state.record?.finDate}\n${state.record?.text}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDatePicker(
      BuildContext context, String label, Function(DateTime) onSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        ElevatedButton(
          onPressed: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) onSelected(date);
          },
          child: const Text('選択'),
        ),
      ],
    );
  }
}