import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';
import 'package:http_parser/http_parser.dart';

abstract class BaseRemotelyDataSourceCreatePile {
  Future<Map<String, dynamic>> createPile(CreatePile pile);

  Future<List<UserFolder>> getUserFolders();

  Future<List<UserFolder>> getTypes();
}

class CreatePileRemotelyDateSource extends BaseRemotelyDataSourceCreatePile {
  @override
  Future<Map<String, dynamic>> createPile(CreatePile pile) async {
    Options options = await DioHelper().options();
    log('${pile.typeId}  typeId');
    log('${pile.folderId}  folderId');
    log('${pile.image}  image');
    log('${pile.pileName}  pileName');
    log('${pile.image}  image');
    log('${pile.totalAmount}  totalAmount');
    log('${pile.participationAmount}  participationAmount');
    log('${pile.totalCollectedPublic}  totalCollectedPublic');
    log('${pile.showTotalRequired}  showTotalRequired');
    log('${pile.payerListPublic}  payerListPublic');
    log('${pile.exactAmountOrNot}  exactAmountOrNot');
    log('${pile.allowPayerToLevMsg}  allowPayerToLevMsg');
    log('${pile.eventDate.substring(0, 10)}  eventDate');
    log('${pile.deadlineDate}  deadlineDate');
    log('${pile.description}  description');

    FormData formData = FormData.fromMap({
      'title': pile.pileName,
      'banner': await MultipartFile.fromFile(pile.image.path,
          filename: pile.image.path.split('/').last.toString(),
          contentType: MediaType("image", "jpeg")),
      'total_amount': pile.totalAmount.toString(),
      'amount_per_participant': pile.participationAmount.toString(),
      'deadline': pile.deadlineDate.substring(0, 10),
      'event_date': pile.eventDate.substring(0, 10),
      'description': pile.description,
      'total_collected_public': pile.totalCollectedPublic ? '1' : '0',
      'total_required_public': pile.showTotalRequired ? '1' : '0',
      'payer_list_public': pile.payerListPublic ? '1' : '0',
      'amount_per_participant_editable': pile.exactAmountOrNot ? '1' : '0',
      'messages_allowed': pile.allowPayerToLevMsg ? '1' : '0',
      'folder_id': pile.folderId.toString(),
      'type_id': pile.typeId.toString(),
    });

    try {
      final Response response = await Dio().post(
        ConstantApi.createPile,
        options: options,
        data: formData,
      );
      Map<String, dynamic> jsonData = response.data;
      print(response.data);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get CreatePile");
    }
  }

  @override
  Future<List<UserFolder>> getUserFolders() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getUserFolders,
        options: options,
      );
      List<UserFolder> jsonData = List<UserFolder>.from(
          (response.data['data'] as List).map((e) => UserFolder.fromJson(e)));

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "get GetUserFolders");
    }
  }

  @override
  Future<List<UserFolder>> getTypes() async {
    Options options = await DioHelper().options();

    try {
      final response = await Dio().get(
        ConstantApi.getType,
        options: options,
      );
      List<UserFolder> jsonData = List<UserFolder>.from(
          (response.data['data'] as List).map((e) => UserFolder.fromJson(e)));

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "  getTypes");
    }
  }
}
