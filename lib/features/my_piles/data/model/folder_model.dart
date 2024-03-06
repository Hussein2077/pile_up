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
        folderId: json["folderId"],
        folderName: json["folderName"],
        myPiles: json["myPiles"],
      );

  Map<String, dynamic> toJson() => {
        "folderId": folderId,
        "folderName": folderName,
        "myPiles": myPiles,
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
