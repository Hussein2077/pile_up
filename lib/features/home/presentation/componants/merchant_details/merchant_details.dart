import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/home/presentation/componants/merchant_details/merchants_stores.dart';

class MerchantDetails extends StatelessWidget {
  const MerchantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.merchants.tr()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.defaultSize!,),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.4),
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
                    padding: EdgeInsets.all(AppSize.defaultSize!),
                    child: MerchantsStores(
                      merchants: Merchants(
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
    );
  }
}
