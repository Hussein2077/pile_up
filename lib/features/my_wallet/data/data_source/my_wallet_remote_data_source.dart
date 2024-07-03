import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/my_wallet/data/models/my_wallet_model.dart';

abstract class BaseRemotelyDataSourceMyWallet {
  Future<MyWalletModel> getMyWallet();
}


class MyWalletRemotelyDateSource extends BaseRemotelyDataSourceMyWallet {
  @override
  Future<MyWalletModel> getMyWallet() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getMyWallet,
        options: options,
      );
      MyWalletModel jsonData = MyWalletModel.fromJson(response.data);
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get MyWallet");
    }
  }
}