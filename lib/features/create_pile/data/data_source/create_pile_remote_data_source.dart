import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';

abstract class BaseRemotelyDataSourceCreatePile {
  Future <Map<String,dynamic>> createPile(CreatePile pile);
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
      // Map<String, dynamic> jsonData = response.data;
      // // List<CreatePile>    jsonData = List<CreatePile>.from(
      // //     (response.data as List).map((e) => CreatePile.toJson(e)));
      // log('$jsonData dddddddddd');
     } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CreatePile");
    }
  }
}