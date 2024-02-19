import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
class NotificationRow extends StatelessWidget {
  const NotificationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(AppSize.defaultSize!*1.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: StringManager.recentNotifications.tr(),
            fontWeight: FontWeight.w700,
            fontSize: AppSize.defaultSize!*2,
          ),
          SizedBox(height: AppSize.defaultSize!,),
          Expanded(
            child: ListView.builder(
            itemCount: 12,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,i) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: AppSize.defaultSize!,),
                        CircleAvatar(radius: AppSize.defaultSize!*2.5,
                        backgroundColor: Colors.black,
                          child: Image.asset(AssetPath.logo),
                        ),
                        SizedBox(width: AppSize.defaultSize!,),
                        Expanded(
                          child: CustomText(
                            text: 'Mohamed Ahmed Participate to Mohamed\'s Birthday pile',
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor2,
                            fontSize: AppSize.defaultSize!*1.4,
                          ),
                        )
                      ],
                    ),
                    Divider(),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
