import 'dart:convert';

class Article {
  final String name;
  final String description;
  final String realization;
  final String gain;

  Article({this.name, this.description, this.realization, this.gain});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'realization': realization,
      'gain': gain
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Article(
        name: map['name'],
        description: map['description'],
        realization: map['realization'],
        gain: map['gain']);
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));
}
