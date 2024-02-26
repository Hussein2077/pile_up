class MyPile {
  final String? pileName;
  final String? description;
  final DateTime? eventDate;
  final DateTime? deadlineDate;
  final DateTime? creationDate;
  final int? totalAmount;
  final int? participationAmount;
  final bool? status;
  final String? pileImage;
  final int? collectedAmount;
  final bool? totalCollectedPublic;
  final bool? showTotalRequired;
  final bool? payerListPublic;
  final bool? exactAmountOrNot;
  final bool? allowPayerToLevMsg;
  final List<Report>? reports;
  final List<Invitation>? invitations;
  final List<PileManager>? pilesManagers;

  MyPile({
    this.pileName,
    this.description,
    this.eventDate,
    this.deadlineDate,
    this.creationDate,
    this.totalAmount,
    this.participationAmount,
    this.status,
    this.pileImage,
    this.collectedAmount,
    this.totalCollectedPublic,
    this.showTotalRequired,
    this.payerListPublic,
    this.exactAmountOrNot,
    this.allowPayerToLevMsg,
    this.reports,
    this.invitations,
    this.pilesManagers,
  });

  factory MyPile.fromJson(Map<String, dynamic> json) => MyPile(
    pileName: json["pileName"]!,
    description: json["description"]!,
    eventDate: json["eventDate"] == null ? null : DateTime.parse(json["eventdate"]),
    deadlineDate: json["deadlineDate"] == null ? null : DateTime.parse(json["deadlineDate"]),
    creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
    totalAmount: json["totalAmount"],
    participationAmount: json["participationAmount"],
    status: json["status"],
    pileImage: json["pileImage"]!,
    collectedAmount: json["collectedAmount"],
    totalCollectedPublic: json["totalCollectedPublic"],
    showTotalRequired: json["showTotalRequierd"],
    payerListPublic: json["payerlistPublic"],
    exactAmountOrNot: json["exactAmountOrNot"],
    allowPayerToLevMsg: json["allowPayertoLevMsg"],
    reports: json["contributions"] ,
    invitations: json["invitations"],
    pilesManagers: json["pilesManagers"],
  );

  Map<String, dynamic> toJson() => {
    "pileName": pileName,
    "description": description,
    "eventdate": eventDate?.toIso8601String(),
    "deadlineDate": deadlineDate?.toIso8601String(),
    "creationDate": creationDate?.toIso8601String(),
    "totalAmount": totalAmount,
    "participationAmount": participationAmount,
    "status": status,
    "pileImage": pileImage,
    "collectedAmount": collectedAmount,
    "totalCollectedPublic": totalCollectedPublic,
    "showTotalRequierd": showTotalRequired,
    "payerlistPublic": payerListPublic,
    "exactAmountOrNot": exactAmountOrNot,
    "allowPayertoLevMsg": allowPayerToLevMsg,
    "contributions": reports == null ? [] : List<dynamic>.from(reports!.map((x) => x.toJson())),
    "invitations": invitations == null ? [] : List<dynamic>.from(invitations!.map((x) => x.toJson())),
    "pilesManagers": pilesManagers == null ? [] : List<dynamic>.from(pilesManagers!.map((x) => x.toJson())),
  };
}
class Invitation {
  final int? invitationId;
  final String? inviterId;
  final String? inviteeId;
  final String? inviteeName;
  final String? inviteeEmail;
  final DateTime? invitationDate;
  final String? inviteeStatus;

  Invitation({
    this.inviteeName,
    this.invitationId,
    this.inviterId,
    this.inviteeEmail,
    this.inviteeStatus,
    this.invitationDate,
    this.inviteeId,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      Invitation(
        invitationId: json["invitationId"],
        inviterId: json["inviterUserId"],
        inviteeEmail: json["inviteeEmail"]!,
        inviteeStatus: json["inviteeStatus"]!,
        invitationDate: json["invitationDate"],
        inviteeId: json["inviteeUserId"],
        inviteeName: json["inviteeUserName"],
      );

  Map<String, dynamic> toJson() =>
      {
        "invitationId": invitationId,
        "inviterUserId": inviterId,
        "inviteeEmail": inviteeEmail,
        "inviteeStatus": inviteeStatus,
        "invitationDate": invitationDate?.toIso8601String(),
        "inviteeUserId": inviteeId,
        'inviteeUserName' : inviteeName,
      };
}

class Report {
  final String? userId;
  final int? reportId;
  final String? userName;
  final int? amount;
  final DateTime? reportDate;

  Report({
    this.reportId,
    this.userId,
    this.amount,
    this.reportDate,
    this.userName,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    reportId: json["contributionId"],
    userId: json["userId"],
    amount: json["amount"],
    reportDate: json["contributionDate"] == null ? null : DateTime.parse(json["contributionDate"]),
    userName: json["contributionUserName"]!,
  );

  Map<String, dynamic> toJson() => {
    "contributionId": reportId,
    "userId": userId,
    "amount": amount,
    "contributionDate": reportDate?.toIso8601String(),
  };
}

class PileManager {
  final int? managerId;
  final String? managerName;
  final String? email;
  final DateTime? date;

  PileManager({
    this.managerId,
    this.managerName,
    this.email,
    this.date,
  });

  factory PileManager.fromJson(Map<String, dynamic> json) => PileManager(
    managerId: json["managerId"],
    managerName: json["managerName"],
    email: json["email"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    'managerId' : managerId,
    "date": date,
    "managerName": managerName,
    "email": email,
  };
}