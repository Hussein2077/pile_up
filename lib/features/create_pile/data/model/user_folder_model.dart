class UserFolder {
  final int folderId;
  final String folderName;
  final String fkUserid;
  // final String? fkUser;
  // final List<Pile> piles;

  UserFolder({
   required this.folderId,
    required this.folderName,
    required this.fkUserid,

  });

  factory UserFolder.fromJson(Map<String, dynamic> json) => UserFolder(
    folderId: json["id"],
    folderName: json["folderName"],
    fkUserid: json["fkUserid"],

  );

  Map<String, dynamic> toJson() => {
    "id": folderId,
    "folderName": folderName,
    "fkUserid": fkUserid,
  };
}