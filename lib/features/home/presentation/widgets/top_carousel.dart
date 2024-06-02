import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/home/presentation/controller/get_home_carousel/get_home_carousel_bloc.dart';

class TopCarousel extends StatefulWidget {
  const TopCarousel({super.key});

  @override
  State<TopCarousel> createState() => _TopCarouselState();
}

class _TopCarouselState extends State<TopCarousel> {
  late CarouselController carouselController;

  @override
  void initState() {
    BlocProvider.of<GetHomeCarouselBloc>(context).add(GetHomeCarouseEvent());
    carouselController = CarouselController();
    super.initState();
  }

  int myCurrentIndex = 0;

  final List<Widget> myItems = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHomeCarouselBloc, GetHomeCarouselState>(
  builder: (context, state) {
    if (state is GetHomeCarouselSuccessMessageState) {
      if(state.internModel.length != myItems.length){
        state.internModel.map((item) {
          myItems.add(Image.network(item.imageUrl));
        }).toList();
      }
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                viewportFraction: 2,
                height: AppSize.screenHeight! * .35,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                }),
            items: myItems,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: widget.carouselList.map((e){},
          // ),
          Container(
            height: AppSize.defaultSize! * 10,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color.fromRGBO(0, 0, 0, 1).withOpacity(.2),
                      const Color.fromRGBO(0, 0, 0, 1).withOpacity(.4),
                      const Color.fromRGBO(0, 0, 0, 1).withOpacity(.7),
                    ])),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   'Shop ',
                      //   style: TextStyle(
                      //       fontSize: AppSize.defaultSize! * 2,
                      //       fontFamily: 'TT Norms Pro Bold.otf',
                      //       color: Colors.white),
                      // ),
                      Text(state.internModel[myCurrentIndex].caption,
                              style: TextStyle(
                                  fontSize: AppSize.defaultSize! * 3,
                                  fontFamily: 'TT Norms Pro Bold.otf',
                                  color: const Color.fromRGBO(3, 188, 164, 1),
                                  fontWeight: FontWeight.bold))
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(delay: 300.ms, duration: 600.ms),
                      // Text(
                      //   'look',
                      //   style: TextStyle(
                      //       fontSize: AppSize.defaultSize! * 2,
                      //       fontFamily: 'TT Norms Pro Bold.otf',
                      //       color: Colors.white),
                      // ),
                      // Text(' good',
                      //         style: TextStyle(
                      //             fontSize: AppSize.defaultSize! * 3,
                      //             fontFamily: 'TT Norms Pro Bold.otf',
                      //             color: const Color.fromRGBO(3, 188, 164, 1),
                      //             fontWeight: FontWeight.bold))
                      //     .animate()
                      //     .fadeIn() // uses `Animate.defaultDuration`
                      //     .scale() // inherits duration from fadeIn
                      //     .move(delay: 300.ms, duration: 600.ms),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: myItems.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: myCurrentIndex == entry.key
                              ? AppSize.defaultSize! * 4
                              : AppSize.defaultSize! * 1.5,
                          height: AppSize.defaultSize! * .3,
                          margin: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSize.defaultSize!),
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : AppColors.primaryColor)
                                    .withOpacity(
                                        myCurrentIndex == entry.key ? 1 : 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          );
        } else if (state is GetHomeCarouselLoadingState) {
          return const LoadingWidget();
        } else if (state is GetHomeCarouselErrorMessageState) {
          return ErrorWidget(state.errorMessage);
        } else {
          return const EmptyWidget();
        }
      },
    );
  }
}
