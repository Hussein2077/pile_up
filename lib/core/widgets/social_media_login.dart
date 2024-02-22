import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenHeight! * .22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              StringManager.or.tr(),
              style: TextStyle(
                  color: AppColors.greyColor2,
                  fontSize: AppSize.defaultSize! * 1.5,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: AppSize.defaultSize! * 1.6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPath.google,
                scale: 4,
              ),
              SizedBox(
                width: AppSize.defaultSize! * 4,
              ),
              Image.asset(
                AssetPath.facebook,
                scale: 4,
              ),
              SizedBox(
                width: AppSize.defaultSize! * 4,
              ),
              Image.asset(
                AssetPath.apple,
                scale: 4,
              ),
              SizedBox(
                width: AppSize.defaultSize! * 4,
              ),
              Image.asset(
                AssetPath.google,
                scale: 4,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.defaultSize! * 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringManager.doNotHaveAccount.tr(),
                style: TextStyle(
                  // color: AppColors.black,
                  fontSize: AppSize.defaultSize! * 1.6,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.signUp);
                },
                child: Text(
                  StringManager.signUp.tr(),
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppSize.defaultSize! * 1.5,
                      fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}