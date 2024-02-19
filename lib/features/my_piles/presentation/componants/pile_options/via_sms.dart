import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class ViaSMS extends StatefulWidget {
  const ViaSMS({super.key});

  @override
  State<ViaSMS> createState() => _ViaSMSState();
}

class _ViaSMSState extends State<ViaSMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.sendSMSInvitation.tr(), isIcon: true),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
            Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                child: Container(
                  // height: AppSize.defaultSize! * 15,
                  width: AppSize.screenWidth! * .92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.defaultSize! * 2.2),
                    child: Column(
                      children: [
                        ColumnWithTextField(
                          text: StringManager.sendTo.tr(),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 1.6,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: StringManager.messageSubject.tr(),
                              fontSize: AppSize.defaultSize! * 1.5,
                            ),
                            CustomText(
                              text: '  Ahmed\'s Birthday',
                              fontSize: AppSize.defaultSize! * 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 1.6,
                        ),
                        CustomTextField(
                          hintText: StringManager.description.tr(),
                          maxLines: 30,
                          height: AppSize.defaultSize! * 26,
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 2.4,
                        ),
                        MainButton(text: StringManager.sendInvitation.tr())
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
