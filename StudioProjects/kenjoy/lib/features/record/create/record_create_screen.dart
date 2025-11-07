import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenjoy/features/record/create/record_create_provider.dart';

class RecordCreatePage extends ConsumerWidget {
  const RecordCreatePage({super.key});
  static const path = '/Record/create';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordCreateProvider);
    final notifier = ref.read(recordCreateProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("記録作成"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'タイトル'),
              onChanged: notifier.updateTitle,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: '内容'),
              onChanged: notifier.updateContent,
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                await notifier.submit();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('送信しました！')),
                  );
                }
              },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('送信'),
            ),
          ],
        ),
      ),
    );
  }
}

