import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/use_case/edit_my_profile_use_case.dart';

abstract class BaseRemotelyDataSourceMyProfile {
  Future<MyProfile> getMyProfile();
  Future <String> editMyProfile(EditProfileParams profile);
}


class MyProfileRemotelyDateSource extends BaseRemotelyDataSourceMyProfile {
  @override
  Future<MyProfile> getMyProfile() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getMyProfile,
        options: options,
      );
      MyProfile jsonData = MyProfile.fromJson(response.data["data"]);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get MyProfile");
    }
  }
  @override
  Future <String> editMyProfile(EditProfileParams profile) async {
    Options options = await DioHelper().options();
   final data={
     'first_name': profile.firstName,
     'last_name': profile.lastName,
     'email': profile.email,
     'pile_reminder'  : profile.reminder,
   };
    try {
      final Response response = await Dio().post(
        ConstantApi.updateMyProfile,
        options: options,
        data: data,
      );
      return 'Success';
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "edit MyProfile");
    }
  }
}