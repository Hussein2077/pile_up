import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cached_network_image.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';

class MiddleCarouselCard extends StatefulWidget {
  const MiddleCarouselCard(
      {super.key, required this.pile,   });

 final Pile  pile;

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
         CachedNetworkCustom(url: widget.pile.banner??"",
           width: AppSize.defaultSize! * 7.5,
           height: double.maxFinite,
         ),
          SizedBox(
            width: AppSize.defaultSize! * .5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.screenWidth! * .55,
                child: CustomText(
                  text: widget.pile.title ?? 'Mohamed\'s Birthday',
                  color: Colors.black,
                  fontSize: AppSize.defaultSize! * 1.6,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                width: AppSize.screenWidth! * .6,
                child: CustomText(
                  text: widget.pile.description ??
                      'it\'s Mohamed\'s birthday, so we should make a birthday for her, it\'s Mohamed\'s birthday.',
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  fontSize: AppSize.defaultSize! * 1.4,
                ),
              ),
              // if (widget.text == null)
              
                Expanded(
                  child: Row(
                    children: [
                      CustomText(
                        text: StringManager.collected.tr(),
                        color: Colors.black,
                        fontSize: AppSize.defaultSize! * 1.6,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: widget.pile.collectedAmount.toString(),
                        color: AppColors.green,
                        fontSize: AppSize.defaultSize! * 1.6,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
