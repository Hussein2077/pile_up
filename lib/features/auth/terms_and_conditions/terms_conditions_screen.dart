import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          'Terms and conditions',
          style: TextStyle(
            fontSize: AppSize.defaultSize! * 1.8,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 5),
        child: const Column(
          children: [
            Term(
              headline: '1. Acceptance of Terms',
              body:
                  'By downloading, installing, accessing, or using [Your Mobile App Name], you agree to comply with and be bound by these terms and conditions, along with our Privacy Policy. If you do not agree with any part of these terms, you may not use our app.',
            ),
            Term(
              headline: '2. License',
              body:
                  'We grant you a non-exclusive, non-transferable, limited license to use [Your Mobile App Name] solely for your personal, non-commercial purposes, subject to these terms and the applicable app store\'s terms of service.',
            ),
            Term(
              headline: '3. User Account',
              body:
                  'Some features of [Your Mobile App Name] may require you to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.',
            ),
            Term(
              headline: '4. Use of the App',
              body:
                  'You agree to use [Your Mobile App Name] only for lawful purposes and in a manner consistent with all applicable local, national, and international laws and regulations.',
            ),
          ],
        ),
      ),
    );
  }
}

class Term extends StatelessWidget {
  const Term({super.key, required this.headline, required this.body});

  final String headline;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppSize.defaultSize! * 1.4,
          ),
        ),
        SizedBox(height: AppSize.defaultSize! * 1.6),
        Text(
          body,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            // color: AppColors.primaryColor,
            fontSize: AppSize.defaultSize! * 1.2,
          ),
        ),
        SizedBox(height: AppSize.defaultSize! * 2.5),
      ],
    );
  }
}
