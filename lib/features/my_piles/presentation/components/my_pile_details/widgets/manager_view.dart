import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class ManagerView extends StatefulWidget {
  const ManagerView({super.key});

  @override
  State<ManagerView> createState() => _ManagerViewState();
}

class _ManagerViewState extends State<ManagerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: AppSize.defaultSize! * 4.8,
        height: AppSize.defaultSize! * 4.8,
        decoration: BoxDecoration(
          color: AppColors.green,
          // shape: BoxShape.circle,
          border: Border.all(color: AppColors.green),
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2.4),
        ),
        child: Center(
          child: InkWell(
            onTap: () {},
            child: Icon(Icons.add,
                size: AppSize.defaultSize! * 3,
                color: AppColors.backgroundColor),
          ),
        ),
      ),
      body: Padding(
      padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
      child: Column(
        children: [
          CustomTextField(
            hintText: StringManager.searchForManager.tr(),
            suffixIcon: Icon(Icons.search,size: AppSize.defaultSize!*1.9, color: AppColors.textSearchHintColor,),
            hintStyle: const TextStyle(color: AppColors.textSearchHintColor),
            // height: AppSize.defaultSize!*4,
          ),
          SizedBox(height: AppSize.defaultSize!,),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      managerRow(text: 'May Kenawi',
                          text2: 'may@example.com',
                          text3: '23/08/2023'
                      ),
                      if(index!=19)
                        const Divider(),
                    ],
                  );
                }),
          ),
          // Align(
          //     alignment: Alignment.bottomRight,
          //     child: FloatingActionButton(onPressed: (){})),
        ],
      ),
    ),);
  }

  Widget managerRow({String?text, String?text2, String?text3,}) {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              fontSize: AppSize.defaultSize! * 1.6,
              fontWeight: FontWeight.w400,
            ), CustomText(
              text: text3,
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        IconButton(onPressed: () {},
            icon: Icon(Icons.close, color: AppColors.primaryColor,
              size: AppSize.defaultSize!*3,))
      ],
    );
  }
}
