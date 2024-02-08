import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/features/my_piles/presentation/widgets/folder.dart';
class MyPiles extends StatefulWidget {
  const MyPiles({super.key});

  @override
  State<MyPiles> createState() => _MyPilesState();
}

class _MyPilesState extends State<MyPiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context,bottom: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: StringManager.searchFor.tr(),
              height: AppSize.defaultSize!*5,
              width: AppSize.screenWidth!,
              hintStyle: TextStyle(
                  color: AppColors.greyColor.withOpacity(.5),
              ),
              suffixIcon: Icon(Icons.search,color: AppColors.greyColor.withOpacity(.5),),
            ),
            SizedBox(height: AppSize.defaultSize!*1.6,),
            FolderWidget(text: 'Birthday',),
            FolderWidget(text: 'Birthday',),
            FolderWidget(text: 'Birthday',),
          ],
        ),
      ),
    );
  }
}
