import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
class MyPileDetailsTabBar extends StatefulWidget {
  const MyPileDetailsTabBar({super.key, required this.tabController});
final TabController tabController;
  @override
  State<MyPileDetailsTabBar> createState() => _MyPileDetailsTabBarState();
}

class _MyPileDetailsTabBarState extends State<MyPileDetailsTabBar> {
  @override
  Widget build(BuildContext context) {
    return             TabBar(
      controller:widget.tabController ,
        dividerColor: AppColors.greyColor.withOpacity(.3),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.primaryColor,
        labelStyle: TextStyle(
          fontSize: AppSize.defaultSize!*1.3,
          color: AppColors.primaryColor.withOpacity(.9),
          fontWeight: FontWeight.w600,

        ),
        padding: EdgeInsets.only(top: AppSize.defaultSize!*1.6),
        tabs: [
          // Padding(
          //   padding:   EdgeInsets.only(bottom: AppSize.defaultSize!*.5),
          //   child: Text(StringManager.manager.tr()),
          // ),
          Padding(
            padding:   EdgeInsets.only(bottom: AppSize.defaultSize!*.5),
            child: Text(StringManager.reports.tr()),
          ),
          Padding(
            padding:   EdgeInsets.only(bottom: AppSize.defaultSize!*.5),
            child: Text(StringManager.sharedWith.tr()),
          ),

        ]);
  }
}
