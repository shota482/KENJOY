import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/record.dart';

// 記録一覧を管理するNotifier
class RecordListNotifier extends Notifier<List<RecordModel>> {
  @override
  List<RecordModel> build() {
    // 初期状態（空のリスト）
    return [];
  }

  // 記録を追加
  void addRecord(RecordModel record) {
    state = [...state, record];
  }

  // 記録を削除
  void removeRecord(RecordModel record) {
    state = state.where((r) => r != record).toList();
  }

  // 全削除
  void clear() {
    state = [];
  }
}

// Provider の定義
final recordListProvider =
NotifierProvider<RecordListNotifier, List<RecordModel>>(() {
  return RecordListNotifier();
});