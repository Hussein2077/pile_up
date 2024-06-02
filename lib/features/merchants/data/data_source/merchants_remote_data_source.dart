import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';

abstract class BaseRemotelyDataSourceMerchants {
  Future<List<Merchant>> getMerchants();
}


class MerchantsRemotelyDateSource extends BaseRemotelyDataSourceMerchants {
  @override
  Future<List<Merchant>> getMerchants() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getMerchants,
        options: options,
      );
      List<Merchant>    jsonData = List<Merchant>.from(
          (response.data as List).map((e) => Merchant.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get Merchants");
    }
  }
}