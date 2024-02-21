import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/vendors/data/model/vendor_model.dart';

abstract class BaseRemotelyDataSourceVendors {
  Future<List<Vendor>> getVendors();
}


class VendorsRemotelyDateSource extends BaseRemotelyDataSourceVendors {
  @override
  Future<List<Vendor>> getVendors() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getVendors,
        options: options,
      );
      List<Vendor> jsonData = List<Vendor>.from(
          (response.data as List).map((e) => Vendor.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get vendors");
    }
  }
}