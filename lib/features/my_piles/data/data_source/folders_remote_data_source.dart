import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/my_piles/data/model/my_piles_model.dart';

abstract class BaseRemotelyDataSourceFolders {

  Future<Map<String, dynamic>> deletePileManager(PileManager manager);

  Future<Map<String, dynamic>> addPileManager(PileManager manager);

  Future<List<PileManager>> getPileManagers();

  Future<List<FolderModel>> getFoldersBySearch(String folderSearch);

}

class FoldersRemotelyDateSource extends BaseRemotelyDataSourceFolders {

  @override
  Future<List<PileManager>> getPileManagers() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getPileManagers,
        options: options,
      );
      List<PileManager> jsonData = List<PileManager>.from(
          (response.data as List).map((e) => PileManager.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "get PileManagers");
    }
  }

  @override
  Future<Map<String, dynamic>> deletePileManager(PileManager manager) async {
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
  Future<Map<String, dynamic>> addPileManager(PileManager manager) async {
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

  @override
  Future<List<FolderModel>> getFoldersBySearch(
      String folderSearch) async {
    Options options = await DioHelper().options();

    final body = {
      'folderName': folderSearch,
    };
    try {
      final response =
      await Dio().get(
        ConstantApi.getFoldersBySearch, options: options, data: body,);

      List<FolderModel> jsonData = List<FolderModel>.from(
          (response.data as List).map((e) => FolderModel.fromJson(e)));
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get Folders by search");
    }
  }
}
