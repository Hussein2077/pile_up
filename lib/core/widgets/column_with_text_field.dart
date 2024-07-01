import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

import '../../features/create_pile/presentation/widgets/create_folder.dart';

class ColumnWithTextField extends StatefulWidget {
  const ColumnWithTextField({
    super.key,
    required this.text,
    this.controller,
    this.text1,
    this.width,
    this.height,
    this.readOnly = false,
    this.onTap,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.requiredInput = false,
    this.dropDown,
    this.maxLine,
    this.obscureText = false,
    this.prefixIcon,
    this.fontSize,
  });

  final String text;
  final String? text1;
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
  final double? fontSize;
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
              fontSize: widget.fontSize ?? AppSize.defaultSize! * 1.5,
            ),
            if (widget.requiredInput)
              CustomText(
                text: ' *',
                fontSize: AppSize.defaultSize! * 1.5,
                color: Colors.red,
              ),
            const Spacer(),
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const CreateFolder(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },              child: Text(
                widget.text1 ?? '',
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.8,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.defaultSize! * .3,
        ),
        widget.dropDown ??
            SizedBox(
                width: widget.width ?? AppSize.screenWidth! * .9,
                height: widget.height ?? AppSize.defaultSize! * 5,
                child: CustomTextField(
                  controller: widget.controller,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  labelText: widget.labelText,
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.hintText,
                  suffixIcon: widget.suffixIcon,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText!,
                  maxLines: widget.obscureText! ? 1 : widget.maxLine,
                )),
      ],
    );
  }
}
