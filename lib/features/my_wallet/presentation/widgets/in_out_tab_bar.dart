import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
class InOutTabBar extends StatefulWidget {
  const InOutTabBar({super.key, required this.tabController});
  final TabController tabController;
  @override
  State<InOutTabBar> createState() => _OptionsTabBarState();
}

class _OptionsTabBarState extends State<InOutTabBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TabBar(
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
              child: Text(StringManager.inString.tr()),
            ),
            Padding(
              padding:   EdgeInsets.only(bottom: AppSize.defaultSize!*.5),
              child: Text(StringManager.outString.tr()),
            ),
          ]),
    );
  }
}
