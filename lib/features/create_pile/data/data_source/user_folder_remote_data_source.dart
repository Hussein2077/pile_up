import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

abstract class BaseRemotelyDataSourceUserFolders {
  Future<List<UserFolder>> getUserFolders();
}


class UserFoldersRemotelyDateSource extends BaseRemotelyDataSourceUserFolders {
  @override
  Future<List<UserFolder>> getUserFolders() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getUserFolders,
        options: options,
      );
      List<UserFolder> jsonData = List<UserFolder>.from(
          (response.data as List).map((e) => UserFolder.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get GetUserFolders");
    }
  }
}