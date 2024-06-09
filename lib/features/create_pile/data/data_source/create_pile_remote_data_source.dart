import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

abstract class BaseRemotelyDataSourceCreatePile {
  Future <Map<String,dynamic>> createPile(CreatePile pile);
  Future<List<UserFolder>> getUserFolders();

}


class CreatePileRemotelyDateSource extends BaseRemotelyDataSourceCreatePile {
  @override
  Future <Map<String,dynamic>> createPile(CreatePile pile) async {
    Options options = await DioHelper().options();
  log('${pile.pileName}');
    try {
      final Response response = await Dio().post(
        ConstantApi.createPile,
        options: options,
        data: pile.toJson(),
      );
      Map<String, dynamic> jsonData = response.data;
      print(response.data);
       return jsonData;
     } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CreatePile");
    }
  }
  @override
  Future<List<UserFolder>> getUserFolders() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getUserFolders,
        options: options,
      );
      List<UserFolder> jsonData = List<UserFolder>.from(
          (response.data['data'] as List).map((e) => UserFolder.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get GetUserFolders");
    }
  }
}