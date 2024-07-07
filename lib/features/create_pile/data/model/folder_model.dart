import 'package:equatable/equatable.dart';

class FolderModel extends Equatable {
  final int id;
  final int userId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Pile> piles;

  const FolderModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.piles,
  });

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
      piles: (json['piles'] as List<dynamic>?)
          ?.map((item) => Pile.fromJson(item))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'piles': piles.map((pile) => pile.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, userId, name, createdAt, updatedAt, piles];
}

class Pile extends Equatable {
  final int id;
  final String uuid;
  final int userId;
  final String title;
  final String? banner;
  final int totalAmount;
  final int amountPerParticipant;
  final String deadline;
  final String eventDate;
  final String description;
  final int totalCollectedPublic;
  final int totalRequiredPublic;
  final int payerListPublic;
  final int amountPerParticipantEditable;
  final int messagesAllowed;
  final int folderId;
  final int typeId;
  final int collectedAmount;
  final String pileStatus;

  const Pile({
    required this.id,
    required this.uuid,
    required this.userId,
    required this.title,
    this.banner,
    required this.totalAmount,
    required this.amountPerParticipant,
    required this.deadline,
    required this.eventDate,
    required this.description,
    required this.totalCollectedPublic,
    required this.totalRequiredPublic,
    required this.payerListPublic,
    required this.amountPerParticipantEditable,
    required this.messagesAllowed,
    required this.folderId,
    required this.typeId,

    required this.collectedAmount,
    required this.pileStatus,
  });

  factory Pile.fromJson(Map<String, dynamic> json) {
    return Pile(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? '',
      userId: json['user_id'] ?? 0,
      title: json['title'] ?? '',
      banner: json['banner'],
      totalAmount: json['total_amount'] ?? 0,
      amountPerParticipant: json['amount_per_participant'] ?? 0,
      deadline:json['deadline'] ,
      eventDate: json['event_date'] ,
      description: json['description'] ?? '',
      totalCollectedPublic: json['total_collected_public'] ?? 0,
      totalRequiredPublic: json['total_required_public'] ?? 0,
      payerListPublic: json['payer_list_public'] ?? 0,
      amountPerParticipantEditable: json['amount_per_participant_editable'] ?? 0,
      messagesAllowed: json['messages_allowed'] ?? 0,
      folderId: json['folder_id'] ?? 0,
      typeId: json['type_id'] ?? 0,

      collectedAmount: json['collected_amount'] ?? 0,
      pileStatus: json['pile_status'] ?? 'INACTIVE',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'user_id': userId,
      'title': title,
      'banner': banner,
      'total_amount': totalAmount,
      'amount_per_participant': amountPerParticipant,
      'deadline': deadline,
      'event_date': eventDate,
      'description': description,
      'total_collected_public': totalCollectedPublic,
      'total_required_public': totalRequiredPublic,
      'payer_list_public': payerListPublic,
      'amount_per_participant_editable': amountPerParticipantEditable,
      'messages_allowed': messagesAllowed,
      'folder_id': folderId,
      'type_id': typeId,
      'collected_amount': collectedAmount,
      'pile_status': pileStatus,
    };
  }

  @override
  List<Object?> get props => [
    id,
    uuid,
    userId,
    title,
    banner,
    totalAmount,
    amountPerParticipant,
    deadline,
    eventDate,
    description,
    totalCollectedPublic,
    totalRequiredPublic,
    payerListPublic,
    amountPerParticipantEditable,
    messagesAllowed,
    folderId,
    typeId,

    collectedAmount,
    pileStatus,
  ];
}
