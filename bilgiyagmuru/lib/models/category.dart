import 'dart:convert';

enum Categories { gundem, teknoloji, finans, bilim, tv, absurt, oyun, spor }

class Category {
  final int categoryId;
  final Categories category;

  Category({required this.categoryId, required this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryId: map['categoryId'] as int,
      category: map['categoryName'] as Categories,
    );
  }

  String categoryName() {
    switch (category) {
      case Categories.gundem:
        return "GÜNDEM";
      case Categories.teknoloji:
        return "TEKNOLOJİ";
      case Categories.finans:
        return "İŞ/FİNANS";
      case Categories.bilim:
        return "BİLİM";
      case Categories.tv:
        return "TV/DİJİTAL";
      case Categories.absurt:
        return "ABSÜRT";
      case Categories.oyun:
        return "OYUN";
      case Categories.spor:
        return "SPOR";
    }
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
