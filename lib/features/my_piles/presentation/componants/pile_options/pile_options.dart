import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/my_piles/presentation/componants/pile_options/widgets/manager_view.dart';
import 'package:pile_up/features/my_piles/presentation/componants/pile_options/widgets/options_tab_bar.dart';
import 'package:pile_up/features/my_piles/presentation/componants/pile_options/widgets/reports_view.dart';
import 'package:pile_up/features/my_piles/presentation/componants/pile_options/widgets/shared_with_view.dart';

class PileOptions extends StatefulWidget {
  const PileOptions({super.key});

  @override
  State<PileOptions> createState() => _PileOptionsState();
}

class _PileOptionsState extends State<PileOptions>
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
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: AppColors.green,
        shape: const CircleBorder(side: BorderSide(color: AppColors.green)),
        child: Icon(Icons.add,
            size: AppSize.defaultSize! * 3, color: AppColors.backgroundColor),
      ),
      appBar: appBar(context, text: 'Mohamed\'s Birthday', isIcon: true),
      body: Center(
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 1.6,
                ),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                AssetPath.image,
                                width: AppSize.defaultSize! * 7.2,
                                height: AppSize.defaultSize! * 7.2,
                                fit: BoxFit.cover,
                              ),
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
                                      text: StringManager.active.tr(),
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
                                        'it\'s Mohamed\'s birthday, so we should make a birthday for him.',
                                    maxLines: 3,
                                    fontSize: AppSize.defaultSize! * 1.2,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(AssetPath.editIcon),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppSize.defaultSize! * 1.6),
                                      child:
                                          SvgPicture.asset(AssetPath.shareIcon),
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
                              height: AppSize.defaultSize! * 3.2,
                              width: AppSize.defaultSize! * 10.4,
                            ),
                            MainButton(
                              text: StringManager.preview.tr(),
                              height: AppSize.defaultSize! * 3.2,
                              width: AppSize.defaultSize! * 10.4,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.pilesDetails);
                              },
                            ),
                            SecondButton(
                              showIcon: false,
                              text: StringManager.closePile.tr(),
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
                        borderRadius:
                            BorderRadius.circular(AppSize.defaultSize!),
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
                                text: 'EGP 750.00',
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
                  height: AppSize.defaultSize! * 1.6,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    fontSize: AppSize.defaultSize!*2,
                    text: StringManager.sharePile.tr(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * .8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shareContainer(
                        icon: Icons.copy_all,
                        text: StringManager.copyLink.tr()),
                    shareContainer(
                        icon: Icons.email_outlined,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.viaEmail);
                        },
                        text: StringManager.viaEmail.tr()),
                    shareContainer(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.viaSMS);
                        },
                        icon: Icons.sms_failed_outlined,
                        text: StringManager.viaSMS.tr()),
                    shareContainer(
                        icon: Icons.qr_code_2_outlined,
                        text: StringManager.qRCode.tr()),
                  ],
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.8,
                ),
                Container(
                  height: AppSize.screenHeight! * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  ),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        OptionsTabBar(
                          tabController: tabController,
                        ),
                        SizedBox(
                          height: AppSize.screenHeight! * .4,
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
              size: AppSize.defaultSize!*3,
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
