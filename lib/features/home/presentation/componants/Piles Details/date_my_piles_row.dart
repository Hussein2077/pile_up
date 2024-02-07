import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';

class MyPilesDateRow extends StatefulWidget {
  const MyPilesDateRow({super.key});

  @override
  State<MyPilesDateRow> createState() => _MyPilesDateRowState();
}

class _MyPilesDateRowState extends State<MyPilesDateRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth! * .4,
      height: AppSize.defaultSize! * 12,
      decoration: BoxDecoration(
          color: AppColors.greyLow,
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * .5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AssetPath.calendarBlue,
            width: AppSize.defaultSize! * 4,
            height: AppSize.defaultSize! * 4,
          ),
          CustomText(
            text: StringManager.eventDate.tr(),
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.4,
          ),
          CustomText(
            text: '1st December 2023',
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.6,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
