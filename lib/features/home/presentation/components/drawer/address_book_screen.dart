import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context, text: StringManager.addressBook.tr(), isIcon: true),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 2.4),
              child: SecondButton(
                  text: StringManager.addContact.tr(),
                  showIconAsset: false,
                  showIcon: false),
            ),
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Contact(showButton: true),
                      ),
                      if (i != 1) const Divider(),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({required this.showButton, super.key});

  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'May Kenawi',
              fontSize: AppSize.defaultSize! * 1.6,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: 'may@example.com',
              fontSize: AppSize.defaultSize! * 1.6,
            ),
            CustomText(
              text: '0114578983256',
              fontSize: AppSize.defaultSize! * 1.6,
            ),
          ],
        ),
        SecondButton(
          height: AppSize.defaultSize! * 4.3,
          width: AppSize.defaultSize! * 12,
          text: 'INVITE',
          showIcon: true,
          showIconAsset: false,
          icon: Icons.person_add_alt_outlined,
          iconHeight: AppSize.defaultSize! * 1.7,
          iconColor: AppColors.primaryColor,
        )
      ],
    );
  }
}
