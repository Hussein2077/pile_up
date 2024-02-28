import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/auth/presentation/forget_password/widgets/pin_text_field.dart';

class SendOTPCode extends StatefulWidget {
  const SendOTPCode({super.key});

  @override
  State<SendOTPCode> createState() => _SendOTPCodeState();
}

class _SendOTPCodeState extends State<SendOTPCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,
          text: StringManager.resetPassword.tr(), isIcon: true),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.pleaseEnterYOurCode.tr(),
              maxLines: 4,
              style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.6,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
              color: AppColors.textFadedColor
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: AppSize.screenWidth! * .6,
                  child: const CustomPinCodeTextField()),
            ),
            // Text(
            //   '${StringManager.youCanResend.tr()}2.00',
            //   maxLines: 4,
            //   style: TextStyle(
            //       fontSize: AppSize.defaultSize! * 1.6,
            //       fontWeight: FontWeight.w400,
            //       overflow: TextOverflow.ellipsis),
            // ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Text(
                  StringManager.resendCode.tr(),
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: AppSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      decorationThickness: 1,
                      color: AppColors.primaryColor,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            SizedBox(height: AppSize.defaultSize! * 3.2),
            MainButton(
              text: StringManager.verify.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.changePassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}
