import 'package:pile_up/features/my_piles/data/model/my_piles_model.dart';

class FolderModel {
  final int folderId;
  final String folderName;
  final List<MyPile> myPiles;

  FolderModel({
    required this.folderId,
    required this.folderName,
    required this.myPiles,
  });

  factory FolderModel.fromJson(Map<String, dynamic> json) => FolderModel(
        folderId: json["blogId"],
        folderName: json["title"],
        myPiles: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "blogId": folderId,
        "title": folderName,
        "content": myPiles,
      };
}

// class FolderSearch {
//   final String? pileName;
//   final String? folderName;
//
//   FolderSearch({
//     this.pileName,
//     this.folderName,
//   });
// }
