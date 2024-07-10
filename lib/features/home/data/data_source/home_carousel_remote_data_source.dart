import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/home/data/model/address_book_model.dart';
import 'package:pile_up/features/home/data/model/blog_model.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';
import 'package:pile_up/features/home/data/model/merchant_model.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';

abstract class BaseRemotelyDataSourceHomeCarousel {
  Future<List<HomeCarousel>> getHomeCarousel();
  Future<List<NotificationModel>> getNotifications();
  Future<List<Merchant>> getMerchants();
  Future<List<BlogModel>> getBlogs();
  Future<List<AddressBookModel >> getAddressBook();

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
          (response.data["data"] as List).map((e) => HomeCarousel.fromJson(e)));
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CarouselSliders");
    }
  }
  @override
  Future<List<NotificationModel>> getNotifications() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getNotifications,
        options: options,
      );
      List<NotificationModel> jsonData = List<NotificationModel>.from(
          (response.data as List).map((e) => NotificationModel.fromJson(e)));
      log('$jsonData dddddddddd');
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CarouselSliders");
    }
  }
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
          dioError: e, endpointName: "get Blogs");
    }
  }  @override
  Future<List<AddressBookModel >> getAddressBook () async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getAddressBook,
        options: options,
      );
      List<AddressBookModel>    jsonData = List<AddressBookModel>.from(
          (response.data["data"] as List).map((e) => AddressBookModel.fromJson(e)));
       return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get getAddressBook");
    }
  }
}