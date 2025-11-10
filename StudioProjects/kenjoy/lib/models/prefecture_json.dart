class Prefecture {
  final int prefId;
  final int regionId;
  final String name;

  Prefecture({required this.prefId, required this.name, required this.regionId});

  factory Prefecture.fromJson(Map<String, dynamic> json) {
    return Prefecture(
      prefId: json['id'],
      name: json['name'],
      regionId: json['region'],
    );
  }
}
