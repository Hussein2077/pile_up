import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

class CustomTextFieldWeb extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  const CustomTextFieldWeb({
    Key? key,
    this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _CustomTextFieldWebState createState() => _CustomTextFieldWebState();
}

class _CustomTextFieldWebState extends State<CustomTextFieldWeb> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? WidgetRatio.heightRatio(25),
      width: widget.width ?? WidgetRatio.widthRatio(330),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: widget.suffixIcon,
          labelStyle: const TextStyle(
            color: AppColors.primaryColor,
          ),
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primaryColor.withOpacity(.4)),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.white.withOpacity(.4))),
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
      ),
    );
  }
}
