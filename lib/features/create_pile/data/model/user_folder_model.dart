class UserFolder {
  final int id;
  final String name;


  UserFolder({
   required this.id,
    required this.name,


  });

  factory UserFolder.fromJson(Map<String, dynamic> json) => UserFolder(
    id: json["id"],
    name: json["name"]??"",


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "folderName": name,

  };
}