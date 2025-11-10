class Prefecture {
  final int pref_id;
  final int region_id;
  final String name;

  Prefecture({required this.pref_id, required this.name, required this.region_id});

  factory Prefecture.fromJson(Map<String, dynamic> json) {
    return Prefecture(
      pref_id: json['id'],
      name: json['name'],
      region_id: json['region'],
    );
  }
}
