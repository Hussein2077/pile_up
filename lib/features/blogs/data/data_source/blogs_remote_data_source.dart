import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';

abstract class BaseRemotelyDataSourceBlogs {
  Future<List<BlogModel>> getBlogs();
}


class BlogsRemotelyDateSource extends BaseRemotelyDataSourceBlogs {
  @override
  Future<List<BlogModel>> getBlogs() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getBlogs,
        options: options,
      );
      List<BlogModel>    jsonData = List<BlogModel>.from(
          (response.data as List).map((e) => BlogModel.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get Internships");
    }
  }
}