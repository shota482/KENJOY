class RecordModel {
  final String title;
  final DateTime startDate;
  final DateTime? finDate;
  final String? text;
  final List<String> picUrls;
  final List<String> prefs;
  final List<String> tags;

  RecordModel(
      {required this.title,
      required this.startDate,
      this.finDate,
      this.text,
      this.picUrls = const [],
      required this.prefs,
      this.tags = const []});

  RecordModel copyWith({
    String? title,
    DateTime? startDate,
    DateTime? finDate,
    String? text,
    List<String>? picUrls,
    List<String>? prefs,
    List<String>? tags,
  }) {
    return RecordModel(
        title: title ?? this.title,
        startDate: startDate ?? this.startDate,
        finDate: finDate ?? this.finDate,
        text: text ?? this.text,
        picUrls: picUrls ?? this.picUrls,
        prefs: prefs ?? this.prefs,
        tags: tags ?? this.tags);
  }
}
