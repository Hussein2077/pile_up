import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.defaultSize! * 1.6),
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
                                borderRadius: BorderRadius.circular(
                                    AppSize.defaultSize!)),
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
                        SizedBox(height: AppSize.defaultSize! * 2.4),
                        CustomSwitchRow(text: StringManager.makeTotalCollectedPublic.tr(),
                            toggle: totalCollected),
                        SizedBox(height: AppSize.defaultSize! * 2.4),
                        CustomSwitchRow(
                            text: StringManager.showTotalRequired.tr(),
                            toggle: totalReq),
                        SizedBox(height: AppSize.defaultSize! * 2.4),
                        CustomSwitchRow(
                            text: StringManager.makePayerListPublic.tr(),
                            toggle: public),
                        SizedBox(height: AppSize.defaultSize! * 2.4),
                        CustomSwitchRow(
                            text: StringManager.exactAmountOrEditable.tr(),
                            toggle: editable),
                        SizedBox(height: AppSize.defaultSize! * 2.4),
                        CustomSwitchRow(
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

}

class CustomSwitchRow extends StatefulWidget {
  CustomSwitchRow({super.key, required this.text, required this.toggle,});

  final String text;
  late bool toggle;
  @override
  State<CustomSwitchRow> createState() => _CustomSwitchRowState();
}

class _CustomSwitchRowState extends State<CustomSwitchRow> {
  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: widget.text,
            fontSize: AppSize.defaultSize! * 1.5,
          ),
          FlutterSwitch(
            width: AppSize.defaultSize! * 5.6,
            height: AppSize.defaultSize! * 2.4,
            toggleSize: 16,
            borderRadius: 8,
            showOnOff: false,
            padding: 1,
            switchBorder: Border.all(color: AppColors.greyColor),
            activeToggleColor: AppColors.primaryColor,
            activeColor: AppColors.orange2,
            inactiveColor: AppColors.orange2,
            toggleColor: AppColors.greyColor,
            value: widget.toggle,
            onToggle: (bool value) {
              setState(() => widget.toggle = value);
            },
          ),
        ],
      );
    }
  }


