import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class VendorStore extends StatelessWidget {
  const VendorStore(
      {super.key, required this.vendors, this.blog = false});

  final Vendor vendors;
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
                        backgroundImage: AssetImage(vendors.image),
                      )
                    : Image.asset(
                        vendors.image,
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
                        text: vendors.text,
                        color: AppColors.blackLow,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w700),
                    CustomText(
                        text: vendors.description,
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

class Vendor {
  final String text;
  final String description;
  final String image;

  Vendor(
      {required this.text, required this.description, required this.image});
}
