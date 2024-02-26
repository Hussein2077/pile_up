import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/calendar/data/model/calendar_model.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

abstract class BaseRemotelyDataSourceCalendar {
  Future<List<Calendar>> getCalendars();
}


class CalendarRemotelyDateSource extends BaseRemotelyDataSourceCalendar {
  @override
  Future<List<Calendar>> getCalendars() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getCalendar,
        options: options,
      );
      List<Calendar> jsonData = List<Calendar>.from(
          (response.data as List).map((e) => UserFolder.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get GetCalendar");
    }
  }
}