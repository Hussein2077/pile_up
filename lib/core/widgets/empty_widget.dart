import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.height, this.width, });
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height:height?? AppSize.screenHeight!*.15,
        width:width??AppSize.screenWidth!*.7,
        child: Center(
          child:CustomText(
            text: StringManager.thereIsNo.tr(),
            fontSize: AppSize.defaultSize!*2,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ) ,
        ),
      ),
    );
  }
}
