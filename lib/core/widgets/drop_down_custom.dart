import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/models/common_type.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

class CustomDropdownButton2 extends StatelessWidget {
  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    super.key, this.dropdownColor,
  });
  final String hint;
  final CommonType? value;
  final List<CommonType> dropdownItems;
  final ValueChanged<CommonType?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? dropdownColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<CommonType>(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: AppSize.defaultSize!*1.4,
                fontWeight: FontWeight.w400,

                color: AppColors.blackLow.withOpacity(.8)
            ),
          ),
        ),
        value: value,
        style: TextStyle(fontSize: AppSize.defaultSize!*1.2,color: AppColors.greyColor2),
        items: dropdownItems
            .map((CommonType item) => DropdownMenuItem<CommonType>(
          value: item,
          child: Container(
            alignment: valueAlignment,
            child: Text(
              item.nameEn,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:   TextStyle(
                fontSize: AppSize.defaultSize!*1.4,
                color: AppColors.greyColor2,
              ),
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? AppSize.defaultSize!*5,
          width: buttonWidth ?? AppSize.screenWidth! * .9,
          padding: buttonPadding ??   EdgeInsets.only(left: AppSize.defaultSize!*1.4, right: AppSize.defaultSize!*1.4),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                border: Border.all(
                  color: AppColors.borderColor.withOpacity(.4),
                ),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon??const Icon(Icons.arrow_drop_down) ,
          iconSize: iconSize ?? AppSize.defaultSize! * 4,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          maxHeight: dropdownHeight ?? AppSize.defaultSize!*20,
          width: dropdownWidth ?? AppSize.screenWidth! * .9,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                color: dropdownColor,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!*1.4),
              ),
          elevation: dropdownElevation ?? 8,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ??   Radius.circular(AppSize.defaultSize!*4),
            thickness: scrollbarThickness != null
                ? MaterialStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? AppSize.defaultSize!*4,
          padding: itemPadding ??   EdgeInsets.only(left: AppSize.defaultSize!*1.4, right: AppSize.defaultSize!*1.4),
        ),
      ),
    );
  }
}