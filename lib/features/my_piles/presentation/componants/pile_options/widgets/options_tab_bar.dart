import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
class OptionsTabBar extends StatefulWidget {
  const OptionsTabBar({super.key, required this.tabController});
final TabController tabController;
  @override
  State<OptionsTabBar> createState() => _OptionsTabBarState();
}

class _OptionsTabBarState extends State<OptionsTabBar> {
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
        padding: EdgeInsets.all(AppSize.defaultSize!),
        tabs: [
          Padding(
            padding:   EdgeInsets.only(bottom: AppSize.defaultSize!*.5),
            child: Text(StringManager.manager.tr()),
          ),
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
