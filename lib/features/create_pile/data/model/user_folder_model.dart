class UserFolder {
  final int folderId;
  final String folderName;
  final int fkUserid;
  // final String? fkUser;
  // final List<Pile> piles;

  UserFolder({
   required this.folderId,
    required this.folderName,
    required this.fkUserid,

  });

  factory UserFolder.fromJson(Map<String, dynamic> json) => UserFolder(
    folderId: json["id"],
    folderName: json["name"],
    fkUserid: json["user_id"],

  );

  Map<String, dynamic> toJson() => {
    "id": folderId,
    "folderName": folderName,
    "fkUserid": fkUserid,
  };
}