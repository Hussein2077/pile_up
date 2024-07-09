import 'package:flutter/material.dart';

@immutable
abstract class BaseGetParticipantEvent {}

class InitEvent extends BaseGetParticipantEvent {}

class GetParticipantEvent extends BaseGetParticipantEvent {
 final int pileId    ;
 GetParticipantEvent(this.pileId);
}
