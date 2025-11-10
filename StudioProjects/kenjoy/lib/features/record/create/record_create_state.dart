import 'package:kenjoy/models/record.dart';

class RecordCreateState {
  final RecordModel? record;
  final bool isLoading;

  RecordCreateState({
    this.record,
    this.isLoading = false,
  });

  RecordCreateState copyWith({
    RecordModel? record,
    bool? isLoading,
  }) {
    return RecordCreateState(
        record: record ?? this.record ,
        isLoading: isLoading ?? this.isLoading
    );
  }
}

