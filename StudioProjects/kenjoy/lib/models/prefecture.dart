class Prefecture {
  final int id;
  final String name;

  Prefecture({required this.id, required this.name});

  factory Prefecture.fromJson(Map<String, dynamic> json) {
    return Prefecture(
      id: json['id'],
      name: json['name'],
    );
  }
}
