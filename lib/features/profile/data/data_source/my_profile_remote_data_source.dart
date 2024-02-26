import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';

abstract class BaseRemotelyDataSourceMyProfile {
  Future<List<MyProfile>> getMyProfile();
}


class MyProfileRemotelyDateSource extends BaseRemotelyDataSourceMyProfile {
  @override
  Future<List<MyProfile>> getMyProfile() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getMyProfile,
        options: options,
      );
      List<MyProfile>    jsonData = List<MyProfile>.from(
          (response.data as List).map((e) => MyProfile.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get MyProfile");
    }
  }
}