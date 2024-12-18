import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/blog_store_builder.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class MerchantDetails extends StatelessWidget {
  const MerchantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar(context, text: StringManager.merchants.tr(), isIcon: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.defaultSize!*1.4),
            Padding(
              padding:
                  EdgeInsets.only(bottom: AppSize.defaultSize! * 1.6),
              child: CustomText(
                text: StringManager.enjoyFantasticDiscounts.tr(),
                color: AppColors.blackLow,
                fontSize: AppSize.defaultSize! * 2,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSize.defaultSize! /2),
                      child: BlogStoreBuilder(
                        imageCircular: true,
                        stores: BlogStoreCardInfo(
                            text: 'BURGER KING INDONESIA',
                            description:
                                'Burger King Corporation is an American multinational chain of hamburger fast food restaurants.',
                            image: 'assets/images/logo1.png'),
                      ),
                    ).animate().fade().scale();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
