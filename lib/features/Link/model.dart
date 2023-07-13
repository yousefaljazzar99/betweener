import '../../core/util/Api static/app_exception.dart';

class LinkResponse {
  final List<Links> results;
  LinkResponse({required this.results});
  factory LinkResponse.fromJson(Map<String, dynamic> json) {
    if (json['links'] is! List) {
      throw InvalidInputException('Expected "links" to be a List');
    }
    final results = <Links>[];
    for (final v in json['links']) {
      if (v is! Map) {
        throw InvalidInputException('Expected link to be a Map');
      }
      results.add(Links.fromJson(v as Map<String, dynamic>));
    }
    return LinkResponse(
      results: results,
    );
  }
}

class Links {
  final int? id;
  String title;
  String link;
  String username;
  int? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Links({
    this.id,
    required this.title,
    required this.link,
    required this.username,
    this.isActive,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      link: json['link'] ?? '',
      username: json['username'] ?? '',
      isActive: json['isActive'] ?? '',
      userId: json['user_id'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'link': link,
      'username': username,
      'isActive': isActive,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
