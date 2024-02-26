import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';

abstract class BaseRemotelyDataSourceNotifications {
  Future<List<Notification>> getNotifications();
}


class NotificationsRemotelyDateSource extends BaseRemotelyDataSourceNotifications {
  @override
  Future<List<Notification>> getNotifications() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getNotifications,
        options: options,
      );
      List<Notification> jsonData = List<Notification>.from(
          (response.data as List).map((e) => Notification.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CarouselSliders");
    }
  }
}