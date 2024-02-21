import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class MiddleCarouselCard extends StatefulWidget {
  const MiddleCarouselCard(
      {super.key, this.text, this.description, this.image});

  final String? text;
  final String? description;
  final String? image;

  @override
  State<MiddleCarouselCard> createState() => _MiddleCarouselCardState();
}

class _MiddleCarouselCardState extends State<MiddleCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth! * .8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.defaultSize!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              fit: BoxFit.cover,
              widget.image ?? AssetPath.image,
              height: double.infinity,
              width: AppSize.defaultSize! * 7,
            ),
          ),
          SizedBox(
            width: AppSize.defaultSize! * .5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.screenWidth! * .6,
                child: CustomText(
                  text: widget.text ?? 'Mohamed\'s Birthday',
                  color: Colors.black,
                  fontSize: AppSize.defaultSize! * 1.6,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                width: AppSize.screenWidth! * .6,
                child: CustomText(
                  text: widget.description ??
                      'it\'s Mohamed\'s birthday, so we should make a birthday for her, it\'s Mohamed\'s birthday.',
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
              ),
              if (widget.text == null)
                Row(
                  children: [
                    CustomText(
                      text: StringManager.collected.tr(),
                      color: Colors.black,
                      fontSize: AppSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: 'EGP 2550',
                      color: AppColors.green,
                      fontSize: AppSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}
