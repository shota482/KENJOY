import 'package:riverpod/riverpod.dart';

import 'RecordCreateState.dart';

final recordCreateProvider =
    NotifierProvider<RecordCreateNotifier, RecordCreateState>(
  RecordCreateNotifier.new,
);

class RecordCreateNotifier extends Notifier<RecordCreateState> {
  @override
  RecordCreateState build() {
    return RecordCreateState();
  }

  void updateTitle(String value) {
    state = state.copyWith(title: value);
  }

  void updateContent(String value) {
    state = state.copyWith(content: value);
  }

  Future<void> submit() async {
    if (state.title.isEmpty || state.content.isEmpty) return;

    state = state.copyWith(isLoading: true);

    //DB保存処理
    await Future.delayed(const Duration(seconds: 1));
    print("submit:${state.title},${state.content}");

    state = state.copyWith(isLoading: false);
  }
}
