import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainButton(
            text: StringManager.downloadCSV.tr(),
            width: AppSize.defaultSize! * 15.2,
            widget: Icon(
              Icons.download,
              color: Colors.white,
              size: AppSize.defaultSize! * 2,
            ),
          ),
          SizedBox(
            height: AppSize.defaultSize!,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      reportsRow(
                          text: 'May Kenawi',
                          text2: 'may@example.com',
                          text3: '23/08/2023'),
                      if (index != 19) const Divider(),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget reportsRow({
    String? text,
    String? text2,
    String? text3,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: text,
              fontSize: AppSize.defaultSize! * 1.6,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: text2,
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: text3,
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '100.0 EGP',
              fontSize: AppSize.defaultSize! * 1.6,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
            CustomText(
              text: 'Cash',
              fontSize: AppSize.defaultSize! * 1.6,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: 'Paid',
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.greyColor.withOpacity(.7),
              size: AppSize.defaultSize! * 2,
            )),
      ],
    );
  }
}
