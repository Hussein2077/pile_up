class PileImIn {
  final String pileName;
  final String description;
  final DateTime eventDate;
  final DateTime deadlineDate;
  final DateTime creationDate;
  final int totalAmount;
  final int participationAmount;
  final bool status;
  final String pileImage;
  final int collectedAmount;
  final List<Member> members;

  PileImIn({
    required this.pileName,
    required this.description,
    required this.eventDate,
    required this.deadlineDate,
    required this.creationDate,
    required this.totalAmount,
    required this.participationAmount,
    required this.status,
    required this.pileImage,
    required this.collectedAmount,
    required this.members,
  });

  // fromJson factory method to create a PileImIn object from JSON
  factory PileImIn.fromJson(Map<String, dynamic> json) {
    return PileImIn(
      pileName: json['pileName'],
      description: json['description'],
      eventDate: DateTime.parse(json['eventDate']),
      deadlineDate: DateTime.parse(json['deadlineDate']),
      creationDate: DateTime.parse(json['creationDate']),
      totalAmount: json['totalAmount'],
      participationAmount: json['participationAmount'],
      status: json['status'],
      pileImage: json['pileImage'],
      collectedAmount: json['collectedAmount'],
      members: json['members'],
    );
  }

  // toJson factory method to convert the PileImIn object to JSON
  Map<String, dynamic> toJson() {
    return {
      'pileName': pileName,
      'description': description,
      'eventDate': eventDate.toIso8601String(),
      'deadlineDate': deadlineDate.toIso8601String(),
      'creationDate': creationDate.toIso8601String(),
      'totalAmount': totalAmount,
      'participationAmount': participationAmount,
      'status': status,
      'pileImage': pileImage,
      'collectedAmount': collectedAmount,
      'members': members,
    };
  }
}


class Member {
  final String memberName;
  final String email;
  final int participatedAmount;

  Member({
    required this.memberName,
    required this.email,
    required this.participatedAmount,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memberName: json['memberName'],
      email: json['email'],
      participatedAmount: json['participatedAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberName': memberName,
      'email': email,
      'participatedAmount': participatedAmount,
    };
  }
}

