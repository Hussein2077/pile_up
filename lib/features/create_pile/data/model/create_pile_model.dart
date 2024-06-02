class CreatePile {
  final String? userId;
  final int? folderId;
  final String? pileName;
  final String? description;
  final String? ziad;
  final DateTime? eventDate;
  final DateTime? deadlineDate;
  final DateTime? creationDate;
  final int? totalAmount;
  final int? participationAmount;
  final bool? status;
  final String? pileImage;
  final int? categoryId;
  final int? collectedAmount;
  final bool? totalCollectedPublic;
  final bool? showTotalRequired;
  final bool? payerListPublic;
  final bool? exactAmountOrNot;
  final bool? allowPayerToLevMsg;

  CreatePile({
    this.userId,
    this.folderId,
    this.pileName,
    this.description,
    this.ziad,
    this.eventDate,
    this.deadlineDate,
    this.creationDate,
    this.totalAmount,
    this.participationAmount,
    this.status,
    this.pileImage,
    this.categoryId,
    this.collectedAmount,
    this.totalCollectedPublic,
    this.showTotalRequired,
    this.payerListPublic,
    this.exactAmountOrNot,
    this.allowPayerToLevMsg,
  });

  factory CreatePile.fromJson(Map<String, dynamic> json) => CreatePile(
    userId: json["userId"],
    folderId: json["folderId"],
    pileName: json["pileName"],
    description: json["description"],
    ziad: json["ziad"],
    eventDate: json["eventdate"] == null ? null : DateTime.parse(json["eventdate"]),
    deadlineDate: json["deadlineDate"] == null ? null : DateTime.parse(json["deadlineDate"]),
    creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
    totalAmount: json["totalAmount"],
    participationAmount: json["participationAmount"],
    status: json["status"],
    pileImage: json["pileImage"],
    categoryId: json["categoryId"],
    collectedAmount: json["collectedAmount"],
    totalCollectedPublic: json["totalCollectedPublic"],
    showTotalRequired: json["showTotalRequierd"],
    payerListPublic: json["payerlistPublic"],
    exactAmountOrNot: json["exactAmountOrNot"],
    allowPayerToLevMsg: json["allowPayertoLevMsg"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "folderId": folderId,
    "pileName": pileName,
    "description": description,
    "ziad": ziad,
    "eventdate": eventDate?.toIso8601String(),
    "deadlineDate": deadlineDate?.toIso8601String(),
    "creationDate": creationDate?.toIso8601String(),
    "totalAmount": totalAmount,
    "participationAmount": participationAmount,
    "status": status,
    "pileImage": pileImage,
    "categoryId": categoryId,
    "collectedAmount": collectedAmount,
    "totalCollectedPublic": totalCollectedPublic,
    "showTotalRequierd": showTotalRequired,
    "payerlistPublic": payerListPublic,
    "exactAmountOrNot": exactAmountOrNot,
    "allowPayertoLevMsg": allowPayerToLevMsg,
  };
}