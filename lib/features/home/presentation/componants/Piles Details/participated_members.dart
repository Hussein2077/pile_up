import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
class ParticipatedMembers extends StatelessWidget {
  const ParticipatedMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'May Kenawi',
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.6,
            fontWeight: FontWeight.w500,
          ),   CustomText(
            text: 'May@gmail.com',
            color: AppColors.greyColor,
            fontSize: AppSize.defaultSize! * 1.2,
          ),
        ],
        ),
        CustomText(
          text: '100.0 EGP',
          color: AppColors.green,
          fontSize: AppSize.defaultSize! * 1.6,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
