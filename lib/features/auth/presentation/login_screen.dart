import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginWithEmailAndPasswordBloc,
            LoginWithEmailAndPasswordState>(
          listener: (context, state) {
            if (state is LoginWithEmailAndPasswordSuccessMessageState) {
              EasyLoading.dismiss();
           Navigator.pushNamed(context, Routes.sendOTPCode,arguments: phoneNumber);
            } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
              EasyLoading.dismiss();
              EasyLoading.showError(state.errorMessage);
            } else if (state is LoginWithEmailAndPasswordLoadingState) {
              EasyLoading.show(status: 'loading...');
            } else {
              EasyLoading.dismiss();
            }
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 10,
                ),
                Image.asset(
                  AssetPath.logo1,
                  height: AppSize.defaultSize! * 7.8,
                  width: AppSize.defaultSize! * 10.1,
                ),
                CustomText(
                  text: StringManager.welcomeBack.tr(),
                  fontSize: AppSize.defaultSize! * 2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.welcomeTextVerifyMob,
                ),
                CustomText(
                  text: StringManager.loginTo.tr(),
                  fontSize: AppSize.defaultSize! * 1.4,
                  color: AppColors.greyColor,
                ),
                // TextButton(
                //     onPressed: () {
                //       if (context.locale == const Locale('en')) {
                //         context.setLocale(const Locale('ar'));
                //       } else {
                //         context.setLocale(const Locale('en'));
                //       }
                //       setState(() {});
                //     },
                //     child: Text(
                //       context.locale == const Locale('en')
                //           ? 'عربي'
                //           : 'English',
                //       style: TextStyle(
                //           fontSize: AppSize.defaultSize! * 1.2,
                //           fontWeight: FontWeight.w600),
                //     )),
                // ColumnWithTextField(
                //   text: StringManager.phone.tr(),
                //   controller: phoneController,
                //   keyboardType: TextInputType.phone,
                //   fontSize: AppSize.defaultSize! * 1.6,
                //   prefixIcon: Icon(
                //     Icons.phone,
                //     color: AppColors.primaryColor,
                //     size: AppSize.defaultSize! * 2.5,
                //   ),
                // ),
                SizedBox(
                  height: AppSize.defaultSize! * 5,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: AppSize.defaultSize! * 1.6),
                    hintText: '1123456789',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyColor),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.defaultSize!)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.defaultSize!)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyColor),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.defaultSize!)),
                    ),
                  ),
                  initialCountryCode: 'EG',
                  onChanged: (phone) {
                    phoneNumber = phone.number;
                  },
                ),
                //Forget Password
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                MainButton(
                  text: StringManager.loginCap.tr(),
                  fontSize: AppSize.defaultSize! * 1.8,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    if (phoneNumber.length != 10) {
                      errorSnackBar(
                          context, StringManager.enterPhoneNumber.tr());
                    } else {
                      BlocProvider.of<LoginWithEmailAndPasswordBloc>(context)
                          .add(LoginWithEmailAndPasswordEvent(
                        phone: '0$phoneNumber',
                      ));
                    }
                  },
                  // width: AppSize.screenWidth! * .9,
                ),

                SizedBox(
                  height: AppSize.defaultSize! * 5,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
