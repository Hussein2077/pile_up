import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';

abstract class BaseRemotelyDataSourceMyProfile {
  Future<List<MyProfile>> getMyProfile();
  Future <Map<String,dynamic>> editMyProfile(MyProfile profile);
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
  @override
  Future <Map<String,dynamic>> editMyProfile(MyProfile profile) async {
    Options options = await DioHelper().options();
    log('${profile.firstName}');
    try {
      final Response response = await Dio().put(
        ConstantApi.createPile,
        options: options,
        data: profile.toJson(),
      );
      Map<String, dynamic> jsonData = response.data;
      print(response.data);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CreatePile");
    }
  }
}