import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';

abstract class BaseRemotelyDataSourceHomeCarousel {
  Future<List<HomeCarousel>> getHomeCarousel();
}


class HomeCarouselRemotelyDateSource extends BaseRemotelyDataSourceHomeCarousel {
  @override
  Future<List<HomeCarousel>> getHomeCarousel() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getHomeCarousel,
        options: options,
      );
      List<HomeCarousel>    jsonData = List<HomeCarousel>.from(
          (response.data as List).map((e) => HomeCarousel.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CarouselSliders");
    }
  }
}