import 'package:pile_up/core/resource_manager/asset_path.dart';

class BlogModel {
  final int blogId;
  final String title;
  final String content;
  String? image;
  final String author;
  final DateTime createdAt;
  final dynamic updatedAt;
  final String category;

  BlogModel({
    required this.blogId,
    required this.title,
    required this.content,
    this.image,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    blogId: json["blogId"],
    image: json["image"]??AssetPath.blog,
    title: json["title"],
    content: json["content"],
    author: json["author"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "blogId": blogId,
    "title": title,
    "content": content,
    "author": author,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt,
    "category": category,
  };
}