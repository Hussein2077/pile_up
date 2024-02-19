import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class MerchantsStores extends StatelessWidget {
  const MerchantsStores(
      {super.key, required this.merchants, this.blog = false});

  final Merchants merchants;
  final bool blog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth! * .95,
      // height: AppSize.defaultSize! * 10.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize!),
                child: blog
                    ? CircleAvatar(
                        radius: AppSize.defaultSize! * 2.5,
                        backgroundImage: AssetImage(merchants.image),
                      )
                    : Image.asset(
                        merchants.image,
                        height: AppSize.defaultSize! * 13,
                        width: AppSize.defaultSize! * 12,
                      ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: merchants.text,
                        color: AppColors.blackLow,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w700),
                    CustomText(
                        text: merchants.description,
                        color: AppColors.blackLow,
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        fontSize: AppSize.defaultSize! * 1.4),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Merchants {
  final String text;
  final String description;
  final String image;

  Merchants(
      {required this.text, required this.description, required this.image});
}
