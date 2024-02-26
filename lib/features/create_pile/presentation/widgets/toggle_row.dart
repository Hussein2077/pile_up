import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class CustomSwitchRow extends StatefulWidget {
  CustomSwitchRow({
    super.key,
    required this.text,
    required this.toggle,
  });

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
        StatefulBuilder(builder: (
            context,
            setState,
            ) {
          return FlutterSwitch(
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
          );
        }),
      ],
    );
  }
}