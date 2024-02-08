import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextStyle? hintStyle;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.hintText,
    this.hintStyle, this.width, this.height, this.maxLines,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height??AppSize.defaultSize! * 4,
      width: widget.width?? AppSize.screenWidth! - (AppSize.defaultSize! * 4),
      child: TextFormField(
        onTap: widget.onTap,
maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        style: TextStyle(fontSize: AppSize.defaultSize!*1.4),


        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          contentPadding:   EdgeInsets.all(AppSize.defaultSize!),

          hintStyle: widget.hintStyle??TextStyle(
            color: AppColors.greyColor,
            fontSize: AppSize.defaultSize!*1.4,
            fontWeight: FontWeight.w400
          ),
          suffixIcon: widget.suffixIcon,
          labelStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppSize.defaultSize! * 1.5,
          ),
          prefixIcon: widget.prefixIcon,
            enabledBorder:OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.borderColor.withOpacity(.4)),
            ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.borderColor.withOpacity(.4)),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primaryColor.withOpacity(.4))),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.borderColor.withOpacity(.4))),
        ),

        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
      ),
    );
  }
}
