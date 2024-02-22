part of 'get_home_carousel_bloc.dart';

@immutable
abstract class GetHomeCarouselState extends Equatable {
const GetHomeCarouselState();

@override
List<Object> get props => [];
}

class GetHomeCarouselInitial extends GetHomeCarouselState {}

class GetHomeCarouselLoadingState extends GetHomeCarouselState{
  const GetHomeCarouselLoadingState();
}

class GetHomeCarouselErrorMessageState extends GetHomeCarouselState{
  final String errorMessage ;

  const GetHomeCarouselErrorMessageState({required this.errorMessage});
}

class GetHomeCarouselSuccessMessageState extends GetHomeCarouselState{
  final List<HomeCarousel> internModel ;

  const GetHomeCarouselSuccessMessageState({ required this.internModel});
}