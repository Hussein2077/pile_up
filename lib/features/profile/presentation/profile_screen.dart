import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  DateTime selectedDate = DateTime.now();
  String selectedValue = 'Option 1';

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.myProfile.tr(), isIcon: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Send Reminder Before',
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 4,
                  ),
                ),
                Text(
                  '4',
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 4,
                  ),
                ),
                Text(
                  'Days',
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(AppSize.defaultSize! * 2),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                child: Container(
                  // height: AppSize.screenHeight!*.5,
                  // width: AppSize.screenWidth!*95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize!)),
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.defaultSize!),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ColumnWithTextField(
                              text: StringManager.firstName.tr(),
                              controller: firstNameController,
                              width: AppSize.screenWidth! * .4,
                              hintText: 'Hussein',
                            ),
                            const Spacer(),
                            ColumnWithTextField(
                              text: StringManager.secondName.tr(),
                              controller: lastNameController,
                              hintText: 'Yasser',
                              width: AppSize.screenWidth! * .4,
                            ),
                          ],
                        ),
                        ColumnWithTextField(
                          text: StringManager.email.tr(),
                          controller: firstNameController,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: const Icon(
                            Icons.mail_outline,
                            color: AppColors.greyColor,
                          ),
                          hintText: 'Hussein',
                        ),
                        ColumnWithTextField(
                          text: StringManager.phoneNum.tr(),
                          controller: firstNameController,
                          suffixIcon: const Icon(
                            Icons.phone,
                            color: AppColors.greyColor,
                          ),
                          keyboardType: TextInputType.phone,
                          hintText: 'Hussein',
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 2.5,
                        ),
                        MainButton(text: StringManager.edit.tr())
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SecondButton(
              text: StringManager.changePassword.tr(),
              showIcon: true,
              iconPath: AssetPath.changePasswordIcon,
              iconHeight: AppSize.defaultSize! * 3,
              iconWidth: AppSize.defaultSize! * 3,
              onTap: () {
                Navigator.pushNamed(context, Routes.changePassword);
              },
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2.5,
            ),
            SecondButton(
              text: StringManager.changeLanguage.tr(),
              showIcon: true,
              iconPath: AssetPath.changeLanguageIcon,
              iconHeight: AppSize.defaultSize! * 3,
              iconWidth: AppSize.defaultSize! * 3,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
