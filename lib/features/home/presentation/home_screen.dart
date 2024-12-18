import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_event.dart';
import 'package:pile_up/features/home/presentation/components/Piles%20Details/piles_details.dart';
import 'package:pile_up/features/home/presentation/components/blog_list_screen.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_state.dart';
import 'package:pile_up/features/home/presentation/components/merchant_details/merchants_list.dart';
import 'package:pile_up/features/home/presentation/controller/get_blogs/get_blogs_bloc.dart';
import 'package:pile_up/features/home/presentation/controller/get_blogs/get_blogs_state.dart';
import 'package:pile_up/features/home/presentation/widgets/merchant_card.dart';
import 'package:pile_up/features/home/presentation/widgets/middle_carousel_card.dart';
import 'package:pile_up/features/home/presentation/widgets/top_carousel.dart';
import 'package:pile_up/features/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;


  final myitems2 = [
    const OurMerchantCard(),
    const OurMerchantCard(),
    const OurMerchantCard(),
    const OurMerchantCard(),
  ];

  @override
  void initState() {
    super.initState();
  }
  final _refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(milliseconds: 600), () {
      completer.complete();
    });

    return completer.future.then<void>((_) {
    BlocProvider.of<GetFoldersBloc>(context).add(GetFoldersEvent());

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, leadingOnPressed: () {
        Scaffold.of(context).openDrawer();
      }),
      body: LiquidPullToRefresh(
    key: _refreshIndicatorKey,
    showChildOpacityTransition: false,
    color: AppColors.primaryColor,
    onRefresh: _handleRefresh,
    child: SingleChildScrollView(
        child: Column(
          children: [
            const TopCarousel(),
            SizedBox(
              height: AppSize.defaultSize! * 1.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                viewRow(
                    text: StringManager.myPiles.tr(),
                    onTap: () {
                      MainScreen.mainIndex = 1;
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const MainScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    }),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                BlocBuilder<GetFoldersBloc, GetFoldersState>(
                  builder: (context, state) {
                    if (state is GetFoldersSuccessMessageState) {
                      List<Pile> getAllPiles(List<FolderModel> folders) {
                        return folders.expand((folder) => folder.piles).toList();
                      }
                      List<Pile> allPiles = getAllPiles(state.folderModel);
                      return SizedBox(
                      height: AppSize.defaultSize! * 12,
                      child: ListView.builder(
                          itemCount: allPiles.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(
                                  AppSize.defaultSize! * .5),
                              child: InkWell(
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen:   PilesDetails(pile:allPiles[index],),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.fade,
                                  );
                                },
                                child:   MiddleCarouselCard(pile:allPiles[index] ,)
                                    .animate()
                                    .fadeIn() // uses `Animate.defaultDuration`
                                    .scale() // inherits duration from fadeIn
                                    .move(delay: 300.ms, duration: 600.ms),
                              ),
                            );
                          }),
                    );
                    }
                    else if (state is GetFoldersLoadingState) {
                      return const LoadingWidget();
                    } else if (state is GetFoldersErrorMessageState) {
                      return ErrorWidget(state.errorMessage);
                    } else {
                      return const EmptyWidget();
                    }
                  },
                ),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                viewRow(
                    text: StringManager.ourMerchant.tr(),
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const MerchantDetails(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    }),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: .3,
                      autoPlay: true,
                      height: AppSize.screenHeight! * .17,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      }),
                  items: myitems2,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.5,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 12.7,
                  child: BlocBuilder<GetBlogsBloc, GetBlogsState>(
                    builder: (context, state) {
                      if (state is GetBlogsSuccessMessageState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            viewRow(
                                text: StringManager.recentUsefulArticles.tr(),
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: BlogListScreen(
                                        blogs: state.internModel),
                                    withNavBar: false,
                                    // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                                  );
                                }),
                            SizedBox(height: AppSize.defaultSize! - 5),
                            // Expanded(
                            //   child: ListView.builder(
                            //       itemCount: state.internModel.length,
                            //       scrollDirection: Axis.horizontal,
                            //       itemBuilder: (context, index) {
                            //         return Padding(
                            //           padding: EdgeInsets.all(
                            //               AppSize.defaultSize! * .5),
                            //           child: InkWell(
                            //             onTap: () {
                            //               PersistentNavBarNavigator
                            //                   .pushNewScreen(
                            //                 context,
                            //                 screen: BlogScreen(
                            //                   blogArguments:
                            //                   BlogRoutesArguments(
                            //                     blog:
                            //                     state.internModel[index],
                            //                     blogs: state.internModel,
                            //                   ),
                            //                 ),
                            //                 withNavBar: false,
                            //                 // OPTIONAL VALUE. True by default.
                            //                 pageTransitionAnimation:
                            //                 PageTransitionAnimation.fade,
                            //               );
                            //             },
                            //             child: MiddleCarouselCard(
                            //               text: state.internModel[index].title,
                            //               description:
                            //               state.internModel[index].content,
                            //               image: state.internModel[index].image,
                            //             )
                            //                 .animate()
                            //                 .fadeIn() // uses `Animate.defaultDuration`
                            //                 .scale() // inherits duration from fadeIn
                            //                 .move(
                            //                 delay: 300.ms,
                            //                 duration: 600.ms),
                            //           ),
                            //         );
                            //       }),
                            // ),
                          ],
                        );
                      } else if (state is GetBlogsLoadingState) {
                        return const LoadingWidget();
                      } else if (state is GetBlogsErrorMessageState) {
                        return ErrorWidget(state.errorMessage);
                      } else {
                        return const EmptyWidget();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 5,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget viewRow({void Function()? onTap, String? text}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            color: AppColors.blackMedium,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.defaultSize! * 1.6,
          ),
          InkWell(
            onTap: onTap,
            child: CustomText(
              text: StringManager.viewAll,
              color: AppColors.red,
              decorationColor: AppColors.red,
              fontWeight: FontWeight.w700,
              textDecoration: TextDecoration.underline,
              fontSize: AppSize.defaultSize! * 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
