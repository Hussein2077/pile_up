import 'package:dio/dio.dart';
import 'package:pile_up/core/models/my_data_model.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/core/utils/methods.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';

abstract class BaseRemotelyDataSource {
  Future<Map<String, dynamic>> loginWithEmailAndPassword(AuthModel authModel);
  Future<MyDataModel> signUpWithEmailAndPassword(SignUpModel signUpModel);


}
class AuthRemotelyDateSource extends BaseRemotelyDataSource{
  @override
  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      AuthModel authModel) async {

    final body = {
      ConstantApi.email: authModel.email,
      ConstantApi.password: authModel.password,
    };

    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;
      Methods.instance.saveUserToken(authToken: jsonData['access_token']);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<MyDataModel> signUpWithEmailAndPassword(SignUpModel signUpModel)async {
    final body = {
      ConstantApi.email: signUpModel.email,
      ConstantApi.password: signUpModel.password,
      'major':signUpModel.major,
      'university':signUpModel.university,
      'eduLevel':signUpModel.eduLevel,
      'gradLevel':signUpModel.gradLevel,
      'dateOfBirth':signUpModel.dateOfBirth,
      'name':signUpModel.name,
      'phone':signUpModel.phone,
    };

    try {
      final response = await Dio().post(
        ConstantApi.signUp,
        data: body,
      );
      MyDataModel jsonData = response.data;
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "signUpWithEmailAndPassword");
    }
  }
}