class CatFact {
  final String text;
  final String createdAt;

  CatFact({required this.text, required this.createdAt});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      text: json['text'],
      createdAt: json['createdAt'],
    );
  }
}
