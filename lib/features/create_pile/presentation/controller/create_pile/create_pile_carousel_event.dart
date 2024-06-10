part of 'create_pile_carousel_bloc.dart';

@immutable
abstract class BaseCreatePileEvent {}

class InitEvent extends BaseCreatePileEvent {}

class CreatePileEvent extends BaseCreatePileEvent {
  final int folderId;
  final String pileName;
  final String description;
  final File image;
  final String eventDate;
  final String deadlineDate;
  final String totalAmount;
  final String participationAmount;
  final int typeId;
  final bool totalCollectedPublic;
  final bool showTotalRequired;
  final bool payerListPublic;
  final bool exactAmountOrNot;
  final bool allowPayerToLevMsg;

  CreatePileEvent({

   required  this.folderId,
  required  this.pileName,
  required  this.description,
  required  this.image,
  required  this.eventDate,
  required  this.deadlineDate,
  required  this.totalAmount,
  required  this.participationAmount,

  required  this.typeId,
  required  this.totalCollectedPublic,
  required  this.showTotalRequired,
  required  this.payerListPublic,
  required  this.exactAmountOrNot,
  required  this.allowPayerToLevMsg,
  });
}