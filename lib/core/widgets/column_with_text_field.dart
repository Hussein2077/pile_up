import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class ColumnWithTextField extends StatefulWidget {
  const ColumnWithTextField({
    super.key,
    required this.text,
    this.controller,
    this.width,
    this.height,
    this.readOnly = false,
    this.onTap,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.requiredInput = false,
    this.dropDown, this.maxLine, this. obscureText=false, this.prefixIcon,
  });

  final String text;
  final String? labelText;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLine;
  final bool readOnly;
  final bool? obscureText;
  final bool requiredInput;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? dropDown;
  final void Function()? onTap;
  final TextInputType keyboardType;

  final TextEditingController? controller;

  @override
  State<ColumnWithTextField> createState() => _ColumnWithTextFieldState();
}

class _ColumnWithTextFieldState extends State<ColumnWithTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),
        Row(
          children: [
            CustomText(
              text: widget.text,
              fontSize: AppSize.defaultSize! * 1.5,
            ).animate()
                .fadeIn() // uses `Animate.defaultDuration`
                .scale() // inherits duration from fadeIn
                .move(delay: 300.ms, duration: 600.ms),
            if (widget.requiredInput)
              CustomText(
                text: ' *',
                fontSize: AppSize.defaultSize! * 1.5,
                color: Colors.red,
              ),
          ],
        ),
        SizedBox(
          height: AppSize.defaultSize! * .3,
        ),
        widget.dropDown ??
            SizedBox(
                width: widget.width ?? AppSize.screenWidth! * .9,
                height: widget.height?? AppSize.defaultSize! * 5,
                child: CustomTextField(
                  controller: widget.controller,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,

                  labelText: widget.labelText,
                  prefixIcon:widget.prefixIcon ,
                  hintText: widget.hintText,
                  suffixIcon: widget.suffixIcon,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText!,
                  maxLines:widget.obscureText!?1: widget.maxLine,
                )),
      ],
    );
  }
}
