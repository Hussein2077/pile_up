
import 'package:equatable/equatable.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';

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