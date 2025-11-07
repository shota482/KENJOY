class Record {
  final String title;
  final DateTime startDate;
  final DateTime? finDate;
  final String? text;
  final List<String>? picUrls;


  Record(
      {required this.title, required this.startDate, this.finDate, this.text, this.picUrls,});

  Record copyWith({
    String? title,
    DateTime? startDate,
    DateTime? finDate,
    String? text,
    List<String>? picUrls,
  }) {
    return Record(
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      finDate: finDate ?? this.finDate,
      text: text ?? this.text,
      picUrls: picUrls ?? this.picUrls,
    );
  }
}