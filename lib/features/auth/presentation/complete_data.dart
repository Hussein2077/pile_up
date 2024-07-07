import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/profile/presentation/controller/my_profile_bloc.dart';

class CompleteDataScreen extends StatefulWidget {
  const CompleteDataScreen({super.key});

  @override
  State<CompleteDataScreen> createState() => _CompleteDataScreenState();
}

class _CompleteDataScreenState extends State<CompleteDataScreen> {
  late TextEditingController emailController;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;


  @override
  void initState() {
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return
      // BlocListener<SignUpWithEmailAndPasswordBloc,
      //   SignUpWithEmailAndPasswordState>(
      // listener: (context, state) {
      //   if (state is SignUpWithEmailAndPasswordSuccessMessageState) {
      //     EasyLoading.dismiss();
      //     Navigator.pushNamedAndRemoveUntil(
      //       context,
      //       Routes.main,
      //       (route) => false,
      //     );
      //   } else if (state is SignUpWithEmailAndPasswordErrorMessageState) {
      //     EasyLoading.dismiss();
      //     EasyLoading.showError(state.errorMessage);
      //   } else if (state is SignUpWithEmailAndPasswordLoadingState) {
      //     EasyLoading.show(status: 'loading...');
      //   }
      // },
      // child:
      BlocConsumer<GetMyProfileBloc, GetMyProfileState>(
        listener: (context, state) {
          if (state is EditMyProfileSuccessMessageState) {
            EasyLoading.dismiss();
         Navigator.pushNamedAndRemoveUntil(context, Routes.main, (route) => false);
          } else if (state is EditMyProfileErrorMessageState) {
            EasyLoading.dismiss();
            errorSnackBar(context, state.errorMessage);
          } else if (state is EditMyProfileLoadingState) {
            EasyLoading.show(status: 'loading...');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, text: StringManager.completeYourData.tr(),
                isIcon: false,
                leading: false),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.defaultSize! * 2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      children: [
                        ColumnWithTextField(
                          text: StringManager.firstName.tr(),
                          controller: firstNameController,
                          width: AppSize.screenWidth! * .4,
                          fontSize: AppSize.defaultSize! * 1.6,
                        ),
                        const Spacer(),
                        ColumnWithTextField(
                          text: StringManager.secondName.tr(),
                          controller: lastNameController,
                          width: AppSize.screenWidth! * .4,
                          fontSize: AppSize.defaultSize! * 1.6,
                        ),
                      ],
                    ),
                    ColumnWithTextField(
                      text: StringManager.email.tr(),
                      controller: emailController,
                      fontSize: AppSize.defaultSize! * 1.6,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppColors.primaryColor,
                        size: AppSize.defaultSize! * 2,
                      ),
                    ),
                    SizedBox(height: AppSize.defaultSize! * 1.5),
                    // Row(
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           selected = !selected;
                    //         });
                    //       },
                    //       icon: Icon(
                    //         selected
                    //             ? Icons.check_circle
                    //             : Icons.check_circle_outline,
                    //         color: AppColors.primaryColor,
                    //         size: AppSize.defaultSize! * 2.5,
                    //       ),
                    //     ),
                    //     Text(
                    //       'I agree to ',
                    //       style: TextStyle(
                    //         color: AppColors.borderColor,
                    //         fontSize: AppSize.defaultSize! * 1.4,
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () => Navigator.pushNamed(context, Routes.terms),
                    //       child: Text(
                    //         'Privacy Policy ',
                    //         style: TextStyle(
                    //           decoration: TextDecoration.underline,
                    //           decorationColor: AppColors.primaryColor,
                    //           color: AppColors.primaryColor,
                    //           fontSize: AppSize.defaultSize! * 1.4,
                    //         ),
                    //       ),
                    //     ),
                    //     Text(
                    //       'and ',
                    //       style: TextStyle(
                    //         color: AppColors.borderColor,
                    //         fontSize: AppSize.defaultSize! * 1.4,
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () => Navigator.pushNamed(context, Routes.terms),
                    //       child: Text(
                    //         'Terms of Use.',
                    //         style: TextStyle(
                    //           decoration: TextDecoration.underline,
                    //           decorationColor: AppColors.primaryColor,
                    //           color: AppColors.primaryColor,
                    //           fontSize: AppSize.defaultSize! * 1.4,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: AppSize.defaultSize! * 1.5),
                    MainButton(
                      text: StringManager.completeYourData.tr(),
                      fontSize: AppSize.defaultSize! * 1.8,
                      fontWeight: FontWeight.w600,
                      onTap: () {
                        if (validation()) {
                          BlocProvider.of<GetMyProfileBloc>(context)
                              .add(EditMyProfileEvent(
                            firstName: firstNameController
                                .text
                            ,
                            lastName: lastNameController
                                .text,
                            email:
                            emailController.text,
                          ));
                        } else {
                          errorSnackBar(
                              context, StringManager.pleaseCompleteYourData
                              .tr());
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      );
  }


  bool validation() {
    if (firstNameController.text == '') {
      return false;
    } else if (lastNameController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
