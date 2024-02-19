import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class CreatePileScreen extends StatefulWidget {
  const CreatePileScreen({super.key});

  @override
  State<CreatePileScreen> createState() => _CreatePileScreenState();
}

class _CreatePileScreenState extends State<CreatePileScreen> {
  DateTime selectedDate = DateTime.now();
  bool totalCollected = false;
  bool totalReq = false;
  bool public = false;
  bool editable = false;
  bool allow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context,
          bottom: false,
          leading: false,
          widget: CustomText(
            text: StringManager.createPile.tr(),
            color: Colors.white,
            fontSize: AppSize.defaultSize! * 2.4,
            fontWeight: FontWeight.w700,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
              child: Container(
                width: AppSize.screenWidth! * .92,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.defaultSize! * .5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSize.defaultSize! * 1.6,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: AppSize.screenHeight! * .2,
                          width: AppSize.screenWidth! * .84,
                          decoration: BoxDecoration(
                              color: AppColors.greyColor3,
                              border: Border.all(color: AppColors.greyColor4),
                              borderRadius:
                                  BorderRadius.circular(AppSize.defaultSize!)),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: AppSize.defaultSize! * 7,
                          ),
                        ),
                      ),
                      ColumnWithTextField(
                        text: StringManager.title.tr(),
                        requiredInput: true,
                      ),
                      ColumnWithTextField(
                        text: StringManager.folder.tr(),
                        requiredInput: true,
                        dropDown: CustomDropdownButton2(
                          hint: '',
                          value: 'My Folder 01',
                          dropdownItems: const [
                            'My Folder 01',
                            'My Folder 02',
                            'My Folder 03',
                          ],
                          onChanged: (String? value) {},
                        ),
                      ),
                      ColumnWithTextField(
                        text: StringManager.type.tr(),
                        dropDown: CustomDropdownButton2(
                          hint: '',
                          value: 'Birthday',
                          dropdownItems: const [
                            'Birthday',
                            'Party',
                            'Wedding',
                          ],
                          onChanged: (String? value) {},
                        ),
                      ),
                      ColumnWithTextField(
                        text: StringManager.totalAmount.tr(),
                        keyboardType: TextInputType.phone,
                      ),
                      ColumnWithTextField(
                        text: StringManager.participatedAmount.tr(),
                        keyboardType: TextInputType.phone,
                      ),
                      ColumnWithTextField(
                        text: StringManager.deadline.tr(),
                        readOnly: true,
                        hintText: selectedDate.toString().substring(0, 10),
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      ColumnWithTextField(
                        text: StringManager.eventDate.tr(),
                        readOnly: true,
                        hintText: selectedDate.toString().substring(0, 10),
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      ColumnWithTextField(
                        text: StringManager.description.tr(),
                        maxLine: 15,
                        height: AppSize.defaultSize! * 15.2,
                      ),
                      customSettingRow(
                          text: StringManager.makeTotalCollectedPublic.tr(),
                          toggle: totalCollected),
                      customSettingRow(
                          text: StringManager.showTotalRequired.tr(),
                          toggle: totalReq),
                      customSettingRow(
                          text: StringManager.makePayerListPublic.tr(),
                          toggle: public),
                      customSettingRow(
                          text: StringManager.exactAmountOrEditable.tr(),
                          toggle: editable),
                      customSettingRow(
                          text: StringManager.allowParticipantsToLeaveMessage
                              .tr(),
                          toggle: allow),
                      SizedBox(
                        height: AppSize.defaultSize! * 3.5,
                      ),
                      MainButton(text: StringManager.create.tr()),
                      SizedBox(
                        height: AppSize.defaultSize! * 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 8.8,
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  customSettingRow({String? text,required bool toggle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontSize: AppSize.defaultSize! * 1.5,
        ),
        Transform.scale(
          scaleX: .8,
          scaleY: .6,
          child: Switch(
            // thumb color (round icon)
            activeColor: AppColors.green,
            activeTrackColor: AppColors.orange2,
            inactiveThumbColor: AppColors.greyColor,
            inactiveTrackColor: AppColors.orange2,

            splashRadius: 5.0,
            // boolean variable value
            // value: forAndroid,
            // changes the state of the switch

            onChanged: (value) {
              log('$toggle ssssss');
              log('$value ssaaaaa');
              if(!toggle) {
                toggle = true;
              }else{
                toggle=false;
              }
              setState(() {});
            },
            value: toggle,
          ),
        ),
      ],
    );
  }
}
