import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/my_piles/data/model/folder_model.dart';

abstract class BaseRemotelyDataSourceFolders {
  Future<List<FolderModel>> getFolders();
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
}