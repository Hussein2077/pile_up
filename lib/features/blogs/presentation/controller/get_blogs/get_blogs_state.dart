part of 'get_blogs_bloc.dart';

@immutable
abstract class GetBlogsState extends Equatable {
const GetBlogsState();

@override
List<Object> get props => [];
}

class GetBlogsInitial extends GetBlogsState {}

class GetBlogsLoadingState extends GetBlogsState{
  const GetBlogsLoadingState();
}

class GetBlogsErrorMessageState extends GetBlogsState{
  final String errorMessage ;

  const GetBlogsErrorMessageState({required this.errorMessage});
}

class GetBlogsSuccessMessageState extends GetBlogsState{
  final List<BlogModel> internModel ;

  const GetBlogsSuccessMessageState({ required this.internModel});
}