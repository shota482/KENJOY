import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/record.dart';
import 'record_create_state.dart';

class RecordCreateNotifier extends Notifier<RecordCreateState> {
  @override
  RecordCreateState build() {
    return RecordCreateState();
  }

  void createRecord(RecordModel record){
    state = state.copyWith(record: record);
  }
}

final recordCreateProvider =
NotifierProvider<RecordCreateNotifier, RecordCreateState>(
      () => RecordCreateNotifier(),
);