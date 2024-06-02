import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';

abstract class BaseRemotelyDataSourcePilesImIn {
  Future<List<PileImIn>> getPilesImIn();
  Future<List<PileImIn>> getPilesImInBySearch(String pileName);
 }


class PilesImInRemotelyDateSource extends BaseRemotelyDataSourcePilesImIn {
  @override
  Future<List<PileImIn>> getPilesImIn() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getPilesImIn,
        options: options,
      );
      List<PileImIn> jsonData = List<PileImIn>.from(
          (response.data as List).map((e) => PileImIn.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get PilesImIn");
    }
  }

  @override
  Future<List<PileImIn>> getPilesImInBySearch(String pileName) async {
    Options options = await DioHelper().options();
    final body = {
      'pileImIn': pileName,
    };

    try {
      final response = await Dio().get(
        ConstantApi.getPilesImInBySearch,
        options: options,
        data: body,
      );
      List<PileImIn> jsonData = List<PileImIn>.from(
          (response.data as List).map((e) => PileImIn.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
}on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get PilesImIn by search");
    }
  }
}