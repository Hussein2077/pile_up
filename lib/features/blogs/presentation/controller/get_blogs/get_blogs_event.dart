part of 'get_blogs_bloc.dart';

@immutable
abstract class BaseGetBlogsEvent {}

class InitEvent extends BaseGetBlogsEvent {}

class GetBlogsEvent extends BaseGetBlogsEvent {}
