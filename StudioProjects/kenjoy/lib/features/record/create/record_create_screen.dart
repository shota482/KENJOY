import 'package:dropdown_search/dropdown_search.dart';
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

  DateTime? startDate;
  DateTime? finDate;
  List<String> _selectedPrefs = [];


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recordCreateProvider);
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
            const Text('訪問した都道府県を選択',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownSearch<String>.multiSelection(
              items: (String? filter, LoadProps? lp) => prefectureList, // ← ここを修正
              selectedItems: _selectedPrefs,
              onChanged: (List<String> newSelected) {
                setState(() {
                  _selectedPrefs = newSelected;
                });
              },
              popupProps: PopupPropsMultiSelection.menu(
                showSearchBox: true,
                showSelectedItems: true,
              ),
              decoratorProps: DropDownDecoratorProps(
                decoration: const InputDecoration(
                  labelText: "訪問した都道府県",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
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
                          prefs: _selectedPrefs,
                          tags: tagController.text.isEmpty
                              ? []
                              : tagController.text
                                  .split(',')
                                  .map((e) => e.trim())
                                  .toList(),
                        );

                        ref.read(recordListProvider.notifier).addRecord(record);

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

const List<String> prefectureList = [
  '北海道', '青森', '岩手', '宮城', '秋田', '山形', '福島',
  '茨城', '栃木', '群馬', '埼玉', '千葉', '東京', '神奈川',
  '新潟', '富山', '石川', '福井', '山梨', '長野',
  '岐阜', '静岡', '愛知', '三重',
  '滋賀', '京都', '大阪', '兵庫', '奈良', '和歌山',
  '鳥取', '島根', '岡山', '広島', '山口',
  '徳島', '香川', '愛媛', '高知',
  '福岡', '佐賀', '長崎', '熊本', '大分', '宮崎', '鹿児島', '沖縄'
];