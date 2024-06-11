import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/cached_network_image.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/widgets/manager_view.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/widgets/my_pile_details_tab_bar.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/widgets/reports_view.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/widgets/shared_with_view.dart';
import 'package:pile_up/features/home/presentation/components/Piles%20Details/piles_details.dart';

class MyPileDetails extends StatefulWidget {
  const MyPileDetails({super.key, required this.pile});
  final Pile pile;
  @override
  State<MyPileDetails> createState() => _MyPileDetailsState();
}

class _MyPileDetailsState extends State<MyPileDetails>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.backgroundColor,
      appBar: appBar(context, text: widget.pile.title??"", isIcon: true),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.defaultSize! * 1.6,
            vertical: AppSize.defaultSize! * 1.6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: AppSize.defaultSize! * 1.6,
              // ),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                child: Container(
                  height: AppSize.defaultSize! * 15,
                  width: AppSize.screenWidth! * .92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: AppSize.defaultSize! * 1.6),
                          CachedNetworkCustom(
                            url: widget.pile.banner??"",
                            height: AppSize.defaultSize! * 8.5,
                            width: AppSize.defaultSize! * 8.5,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppSize.defaultSize! * 7.2,
                                height: AppSize.defaultSize! * 2.4,
                                decoration: BoxDecoration(
                                    color: AppColors.green2,
                                    borderRadius: BorderRadius.circular(
                                        AppSize.defaultSize!)),
                                child: Center(
                                  child: CustomText(
                                    text: widget.pile.pileStatus,
                                    fontSize: AppSize.defaultSize! * 1.3,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppSize.defaultSize!,
                              ),
                              SizedBox(
                                width: AppSize.defaultSize! * 15,
                                child: CustomText(
                                  text:
                                      widget.pile.description??"",
                                  maxLines: 3,
                                  fontSize: AppSize.defaultSize! * 1.2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    AssetPath.editIcon,
                                    height: AppSize.defaultSize! * 1.6,
                                    width: AppSize.defaultSize! * 1.6,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.defaultSize! * 1.6),
                                    child:
                                        SvgPicture.asset(AssetPath.shareIcon,
                                          height: AppSize.defaultSize! * 1.6,
                                          width: AppSize.defaultSize! * 1.6,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(height: AppSize.defaultSize!*1.6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MainButton(
                            text: StringManager.participate.tr(),
                            fontWeight: FontWeight.w400,
                            height: AppSize.defaultSize! * 3.2,
                            width: AppSize.defaultSize! * 10.4,
                          ),
                          MainButton(
                            text: StringManager.preview.tr(),
                            fontWeight: FontWeight.w400,
                            height: AppSize.defaultSize! * 3.2,
                            width: AppSize.defaultSize! * 10.4,
                            onTap: () {

                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen:   PilesDetails(pile: widget.pile,),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                                );

                            },
                          ),
                          SecondButton(
                            showIcon: false,
                            showIconAsset: false,
                            text: StringManager.closePile.tr(),
                            fontWeight: FontWeight.w400,
                            height: AppSize.defaultSize! * 3.2,
                            width: AppSize.defaultSize! * 10.4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  child: Container(
                    height: AppSize.defaultSize! * 7.5,
                    width: AppSize.screenWidth! * .92,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'AVAILABLE TO REDEEM',
                              fontSize: AppSize.defaultSize! * 1.2,
                            ),
                            CustomText(
                              text: widget.pile.collectedAmount.toString(),
                              fontSize: AppSize.defaultSize! * 2.2,
                              color: AppColors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        MainButton(
                          text: StringManager.redeem.tr(),
                          height: AppSize.defaultSize! * 4,
                          width: AppSize.defaultSize! * 13.6,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: AppSize.defaultSize!,
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: CustomText(
              //     fontSize: AppSize.defaultSize!*2,
              //     text: StringManager.sharePile.tr(),
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // SizedBox(
              //   height: AppSize.defaultSize! * .8,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     shareContainer(
              //         icon: Icons.copy_all,
              //         text: StringManager.copyLink.tr()),
              //     shareContainer(
              //         icon: Icons.email_outlined,
              //         onTap: () {
              //           Navigator.pushNamed(context, Routes.viaEmail);
              //         },
              //         text: StringManager.viaEmail.tr()),
              //     shareContainer(
              //         onTap: () {
              //           Navigator.pushNamed(context, Routes.viaSMS);
              //         },
              //         icon: Icons.sms_failed_outlined,
              //         text: StringManager.viaSMS.tr()),
              //     shareContainer(
              //         icon: Icons.qr_code_2_outlined,
              //         text: StringManager.qRCode.tr()),
              //   ],
              // ),
              // SizedBox(
              //   height: AppSize.defaultSize! * 1.8,
              // ),
              Container(
                //Changes the card height
                height: AppSize.screenHeight! * .64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                ),
                child: DefaultTabController(
                  initialIndex: 1,
                  length: 3,
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      MyPileDetailsTabBar(
                        tabController: tabController,
                      ),
                      SizedBox(
                        //Changes the tab content height
                        height: AppSize.screenHeight! * .57,
                        child: TabBarView(
                            controller: tabController,
                            children: const [
                              ManagerView(),
                              ReportsView(),
                              SharedWithView(),
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  shareContainer({IconData? icon, String? text, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.defaultSize! * 6.4,
        width: AppSize.defaultSize! * 8.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.defaultSize!),
            border: Border.all(color: AppColors.orange)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: AppColors.orange,
              size: AppSize.defaultSize! * 3,
            ),
            CustomText(
              text: text,
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
