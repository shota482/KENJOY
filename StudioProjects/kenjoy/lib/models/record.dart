class RecordType {
  final String title;
  final DateTime startDate;
  final DateTime? finDate;
  final String? text;
  final List<String>? picUrls;
  final List<String> prefs;
  final List<String>? tags;


  RecordType(
      {required this.title, required this.startDate, this.finDate, this.text, this.picUrls,required this.prefs,this.tags});

  RecordType copyWith({
    String? title,
    DateTime? startDate,
    DateTime? finDate,
    String? text,
    List<String>? picUrls,
    List<String>? prefs,
    List<String>? tags,
  }) {
    return RecordType(
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      finDate: finDate ?? this.finDate,
      text: text ?? this.text,
      picUrls: picUrls ?? this.picUrls,
      prefs: prefs ?? this.prefs,
      tags: tags ?? this.tags
    );
  }
}