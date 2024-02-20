import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class SharedWithView extends StatefulWidget {
  const SharedWithView({super.key});

  @override
  State<SharedWithView> createState() => _SharedWithViewState();
}

class _SharedWithViewState extends State<SharedWithView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
      child: Column(
        children: [
          CustomTextField(
            hintText: StringManager.searchForName.tr(),
            suffixIcon: Icon(Icons.search,size: AppSize.defaultSize!*1.9),
            // height: AppSize.defaultSize!*4,
          ),
          SizedBox(height: AppSize.defaultSize!,),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sharedWithRow(text: 'May Kenawi',
                          text2: 'may@example.com',

                      ),
                      if(index!=19)
                        const Divider(),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget sharedWithRow({String?text, String?text2,}) {
    return Column(
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
        ),
      ],
    );
  }
}
