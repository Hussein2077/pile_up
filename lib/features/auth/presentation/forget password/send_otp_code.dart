
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/auth/presentation/forget%20password/widgets/pin_text_field.dart';

class SendOTPCode extends StatefulWidget {
  const SendOTPCode({super.key});

  @override
  State<SendOTPCode> createState() => _SendOTPCodeState();
}

class _SendOTPCodeState extends State<SendOTPCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,text: StringManager.forgetPassword.tr()),
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
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            const CustomPinCodeTextField(),
            Text(
              '${StringManager.youCanResend.tr()}2.00',
              maxLines: 4,
              style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.6,

                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
            TextButton(
              onPressed: () {},

              child: Text(
                StringManager.resendCode.tr(),
                maxLines: 4,
                style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.7,
                    fontWeight: FontWeight.w700,
                    decoration:TextDecoration.underline ,
                    decorationColor: AppColors.green,
                    decorationThickness: 2,
                    color: AppColors.green,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
              MainButton(text: StringManager.verify.tr(),onTap: (){
              Navigator.pushNamed(context, Routes.changePassword);
            },)
          ],
        ),
      ),
    );
  }
}
