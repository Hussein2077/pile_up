import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';

class UserRowDrawer extends StatelessWidget {
  const UserRowDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.profile);
      },
      child: SizedBox(
        height: AppSize.defaultSize! * 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSize.defaultSize! * 1,
            ),
            CircleAvatar(
              radius: AppSize.defaultSize! * 2,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: AppSize.defaultSize! * 3.5,
              ),
            ),
            SizedBox(
              width: AppSize.defaultSize! * 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${MyProfile.getInstance().firstName} ${MyProfile.getInstance().lastName}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.defaultSize! * 1.4,
                  ),
                ),
                Text(
                  StringManager.viewProfile.tr(),
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 1.2,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
