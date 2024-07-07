import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/presentation/controller/my_profile_bloc.dart';

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
  late int reminder;

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
        child: BlocConsumer<GetMyProfileBloc, GetMyProfileState>(
          listener: (context, state) {
            if (state is EditMyProfileSuccessMessageState) {
              EasyLoading.dismiss();
              BlocProvider.of<GetMyProfileBloc>(context)
                  .add(GetMyProfileEvent());
            } else if (state is EditMyProfileErrorMessageState) {
              EasyLoading.dismiss();
              errorSnackBar(context, state.errorMessage);
            } else if (state is EditMyProfileLoadingState) {
              EasyLoading.show(status: 'loading...');
            }
          },
          builder: (context, state) {
            if (state is GetMyProfileLoadingState) {
              return const LoadingWidget();
            } else if (state is GetMyProfileSuccessMessageState) {
              reminder = state.internModel.reminder ?? 0;
              firstNameController.text = state.internModel.firstName ?? '';
              lastNameController.text = state.internModel.lastName ?? '';
              emailController.text = state.internModel.email ?? '';
              phoneController.text = state.internModel.mobileNumber ?? '';
              log('${state.internModel.mobileNumber}ssfefgg');
              return Column(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Row(
                      children: [
                        SizedBox(
                          width: AppSize.defaultSize! * 4,
                        ),
                        Text(
                          'Send Reminder Before',
                          style: TextStyle(
                            fontSize: AppSize.defaultSize! * 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (reminder > 1) {
                              reminder--;
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: AppColors.primaryColor,
                            size: AppSize.defaultSize! * 4,
                          ),
                        ),
                        Text(
                          '$reminder',
                          style: TextStyle(
                            fontSize: AppSize.defaultSize! * 1.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            reminder++;
                            setState(() {});
                          },
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
                    );
                  }),
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
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: const Icon(
                                  Icons.mail_outline,
                                  color: AppColors.greyColor,
                                ),
                                hintText: 'email',
                              ),
                              ColumnWithTextField(
                                text: StringManager.mobileNum.tr(),
                                controller: phoneController,
                                suffixIcon: const Icon(
                                  Icons.phone,
                                  color: AppColors.greyColor,
                                ),
                                keyboardType: TextInputType.phone,
                                readOnly: true,
                                hintText: '01123456789',
                              ),
                              SizedBox(
                                height: AppSize.defaultSize! * 2.5,
                              ),
                              MainButton(
                                  text: StringManager.edit.tr(),
                                  onTap: () {
                                    BlocProvider.of<GetMyProfileBloc>(context)
                                        .add(EditMyProfileEvent(
                                            firstName: firstNameController
                                                    .text.isNotEmpty
                                                ? firstNameController.text
                                                : state.internModel.firstName!,
                                            lastName: lastNameController
                                                    .text.isNotEmpty
                                                ? lastNameController.text
                                                : state.internModel.lastName!,
                                            email:
                                                emailController.text.isNotEmpty
                                                    ? emailController.text
                                                    : state.internModel.email!,
                                            reminder: reminder));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * .5,
                  ),
                  SecondButton(
                    text: StringManager.changeLanguage.tr(),
                    showIconAsset: true,
                    showIcon: false,
                    iconPath: AssetPath.changeLanguageIcon,
                    iconHeight: AppSize.defaultSize! * 3,
                    iconWidth: AppSize.defaultSize! * 3,
                    onTap: () {},
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
