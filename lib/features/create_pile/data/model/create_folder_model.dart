
class CreateFolderModel {
  final String folderName;


  CreateFolderModel({
    required this.folderName,

  });

  factory CreateFolderModel.fromJson(Map<String, dynamic> json) => CreateFolderModel(
    folderName: json["folderName"]!,

  );

  Map<String, dynamic> toJson() => {
    "folderName": folderName,
  };
}
