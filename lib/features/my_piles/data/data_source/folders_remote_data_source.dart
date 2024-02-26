import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/my_piles/data/model/folder_model.dart';
import 'package:pile_up/features/my_piles/data/model/my_piles_model.dart';

abstract class BaseRemotelyDataSourceFolders {
  Future<List<FolderModel>> getFolders();
  Future<Map<String,dynamic>> deletePileManager(PileManager manager);
  Future<Map<String,dynamic>> addPileManager(PileManager manager);
}


class FoldersRemotelyDateSource extends BaseRemotelyDataSourceFolders {
  @override
  Future<List<FolderModel>> getFolders() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getFolders,
        options: options,
      );
      List<FolderModel> jsonData = List<FolderModel>.from(
          (response.data as List).map((e) => FolderModel.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get Folders");
    }
  }
  @override
  Future <Map<String,dynamic>> deletePileManager(PileManager manager) async {
    Options options = await DioHelper().options();
    log('${manager.managerName}');
    try {
      final Response response = await Dio().delete(
        ConstantApi.createPile,
        options: options,
        data: manager.toJson(),
      );
      Map<String, dynamic> jsonData = response.data;
      print(response.data);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "delete PileManager");
    }
  }
  @override
  Future <Map<String,dynamic>> addPileManager(PileManager manager) async {
    Options options = await DioHelper().options();
    log('${manager.managerName}');
    try {
      final Response response = await Dio().post(
        ConstantApi.createPile,
        options: options,
        data: manager.toJson(),
      );
      Map<String, dynamic> jsonData = response.data;
      print(response.data);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "add PileManager");
    }
  }
}