part of 'create_pile_carousel_bloc.dart';

@immutable
abstract class BaseCreatePileEvent {}

class InitEvent extends BaseCreatePileEvent {}

class CreatePileEvent extends BaseCreatePileEvent {
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

  CreatePileEvent({
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
}
