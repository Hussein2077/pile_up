import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cached_network_image.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';

class MyPileCard extends StatefulWidget {
  const MyPileCard({super.key, required this.pile});

 final  Pile pile;

  @override
  State<MyPileCard> createState() => _MyPileCardState();
}

class _MyPileCardState extends State<MyPileCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkCustom(url: widget.pile.banner??"",
          width: AppSize.defaultSize! * 7,
          height: AppSize.defaultSize! * 7,
        ),
        SizedBox(
          width: AppSize.defaultSize! * .5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSize.screenWidth! * .6,
              child: Row(
                children: [
                  CustomText(
                    text: widget.pile.title ,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                    fontSize: AppSize.defaultSize! * 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    text: '  (${widget.pile.pileStatus})',
                    color: AppColors.green,
                    textAlign: TextAlign.start,
                    fontSize: AppSize.defaultSize! * 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppSize.screenWidth! * .6,
              child: CustomText(
                text: widget.pile.description ??
                    'it\'s Mohamed\'s birthday, so we should make a birthday for her, it\'s Mohamed\'s birthday.',
                maxLines: 3,
                textAlign: TextAlign.start,
                fontSize: AppSize.defaultSize! * 1.2,
              ),
            ), SizedBox(height: AppSize.defaultSize!*.6,),
            // if (widget.pile.title == null)
              Row(
                children: [
                  CustomText(
                    text: StringManager.collected.tr(),
                    color: Colors.black,
                    fontSize: AppSize.defaultSize! * 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    text: widget.pile.collectedAmount.toString(),
                    color: AppColors.green,
                    fontSize: AppSize.defaultSize! * 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: AppSize.defaultSize!*2,),
      ],
    );
  }
}
