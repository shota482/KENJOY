
class RecordCreateState {
  final String title;
  final String content;
  final bool isLoading;

  RecordCreateState({
    this.title = "",
    this.content = "",
    this.isLoading = false,
  });

  RecordCreateState copyWith({
    String? title,
    String? content,
    bool? isLoading,
  }) {
    return RecordCreateState(
        title: title ?? this.title,
        content: content ?? this.content,
        isLoading: isLoading ?? this.isLoading
    );
  }
}

