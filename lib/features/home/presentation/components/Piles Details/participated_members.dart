import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/create_pile/data/model/Participant.dart';
class ParticipatedMembers extends StatelessWidget {
  const ParticipatedMembers({super.key, required this.participant});
 final  Participant participant;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: '${participant.firstName} ${participant.lastName}',
            color: AppColors.black,
            fontSize: AppSize.defaultSize! * 1.6,
            fontWeight: FontWeight.w500,
          ),   CustomText(
            text: participant.phoneNumber,
            color: AppColors.greyColor,
            fontSize: AppSize.defaultSize! * 1.2,
          ),
        ],
        ),
        CustomText(
          text: '${participant.participatedAmount} EGP',
          color: AppColors.green,
          fontSize: AppSize.defaultSize! * 1.6,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
