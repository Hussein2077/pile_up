import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pile_up/core/error/exception.dart';
import 'package:pile_up/core/models/my_data_model.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/core/utils/methods.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:pile_up/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
abstract class BaseRemotelyDataSource {
  Future<Map<String, dynamic>> loginWithEmailAndPassword(AuthModel authModel);

  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      SignUpModel signUpModel);

  Future<String> sendCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel);

  Future<Map<String, dynamic>> resetPassword(SignUpModel signUpModel);
  Future<AuthWithGoogleModel> sigInWithGoogle();

  Future<AuthWithAppleModel> sigInWithApple();

}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      AuthModel authModel) async {
    final body = {
      'email': authModel.email,
      "password": authModel.password,
    };

    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await Methods.instance.saveUserToken(authToken: jsonData['data']['token']);
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }


  @override
  Future<AuthWithGoogleModel> sigInWithGoogle() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _googleSignIn = GoogleSignIn(scopes: ['email']);
    Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
    // // ignore: unused_element
    // Future logout() => _googleSignIn.disconnect();
    final userModel = await login();
    log('${userModel?.id}_googleSignIn');
    log('${userModel?.email}_googleSignIn');
    // final devicedata =
    // await DioHelper().initPlatformState(); // to get information device
    Map<String, String> headers = await DioHelper().header();

    if (userModel == null) {
      throw SiginGoogleException();
    } else {
      final body = {
        ConstantApi.email: userModel.email,
        "socicaID": userModel.id,
        "userRole": "User",
      };
      try {
        final response = await Dio().post(
          ConstantApi.login,
          data: body,
          options: Options(
            headers: headers,
          ),
        );

        Map<String, dynamic> resultData = response.data;

        MyDataModel userData = MyDataModel.fromMap(resultData);
        SharedPreferences preferences = await SharedPreferences.getInstance();

        await  Methods.instance.saveUserToken(authToken: resultData['token']);
        return AuthWithGoogleModel(apiUserData: userData, userData: userModel);
      } on DioException catch (e) {
        throw DioHelper.handleDioError(
            dioError: e, endpointName: "sigInWithGoogle");
      }
    }
  }

  @override
  Future<AuthWithAppleModel> sigInWithApple() async {
    final AuthorizationCredentialAppleID? credential;
    try{
      credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
    }catch(e){
      log(e.toString());
      throw SiginApplexception();
    }
    Map<String, String> headers = await DioHelper().header();
    final body = {
      ConstantApi.email: credential.email,
      "socicaID": credential.userIdentifier,
      "userRole": "User",
    };
    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> resultData = response.data;

      MyDataModel userData = MyDataModel.fromMap(resultData);
      SharedPreferences preferences = await SharedPreferences.getInstance();

      await  Methods.instance.saveUserToken(authToken: resultData['token']);
      return AuthWithAppleModel(apiUserData: userData, userData: credential);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "sigInWithApple");
    }
  }


  @override
  Future<Map<String, dynamic>> signUpWithEmailAndPassword(
      SignUpModel signUpModel) async {
    final body = {
      ConstantApi.email: signUpModel.email,
      ConstantApi.password: signUpModel.password,
      'first_name': signUpModel.name,
      'last_name': signUpModel.lastName,
      'phone_number': signUpModel.phone,
      'fcm_token': 'fcm_token',
    };

    try {
      final response = await Dio().post(
        ConstantApi.signUp,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;
      await Methods.instance.saveUserToken(authToken: jsonData['data']['token']);
      if (jsonData['data']['token'] == null) {
        DioException? e;
        throw DioHelper.handleDioError(
            dioError: e, endpointName: "signUpWithEmailAndPassword");
      } else {
        return jsonData;
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "signUpWithEmailAndPassword");
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword(SignUpModel signUpModel) async {
    final body = {
      'newPassword' : signUpModel.password,
      'email': signUpModel.email,
      'otp': signUpModel.code,
    };

    try {
      final response = await Dio().post(
        ConstantApi.resetPassword,
        data: body,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "changePassword");
    }
  }


  @override
  Future<String> sendCode(SignUpModel signUpModel) async {
    final body = {
      'email': signUpModel.email,
    };

    try {
      final response = await Dio().post(
        ConstantApi.sendCode,
        data: body,
      );

      String jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "sendCode");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyCode(SignUpModel signUpModel) async {
    final body = {
      'email': signUpModel.email,
      'otp': signUpModel.code,
    };

    try {
      final response = await Dio().post(
        ConstantApi.verifyCode,
        data: body,
      );

      Map<String, dynamic> jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "verifyCode");
    }
  }

}

class AuthWithGoogleModel {
  final GoogleSignInAccount userData;

  final MyDataModel apiUserData;

  AuthWithGoogleModel({required this.apiUserData, required this.userData});
}

class AuthWithAppleModel {
  final AuthorizationCredentialAppleID userData;

  final MyDataModel apiUserData;

  AuthWithAppleModel({required this.apiUserData, required this.userData});
}