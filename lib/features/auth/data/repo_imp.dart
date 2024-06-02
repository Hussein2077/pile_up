import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/models/my_data_model.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/auth/data/auth_remote_data_source.dart';
import 'package:pile_up/features/auth/domain/repo/base_repo.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';

class RepositoryImp extends BaseRepository {
  final BaseRemotelyDataSource baseRemotelyDataSource;

  RepositoryImp({required this.baseRemotelyDataSource});
  @override
  Future<Either<AuthWithGoogleModel, Failure>> signWithGoogle() async {
    try {
      final result = await baseRemotelyDataSource.sigInWithGoogle();
      return Left(result);
    } on Exception catch (e) {
      return Right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<AuthWithAppleModel, Failure>> sigInWithApple() async {
    try {
      final result = await baseRemotelyDataSource.sigInWithApple();
      return Left(result);
    } on Exception catch (e) {
      return Right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Map<String, dynamic>, Failure>> loginWithEmailAndPassword(AuthModel authModel) async {
    try {
      final result =
          await baseRemotelyDataSource.loginWithEmailAndPassword(authModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Map<String, dynamic>, Failure>> signUpWithEmailAndPassword(SignUpModel signUpModel) async{
    try {
      final result =
          await baseRemotelyDataSource.signUpWithEmailAndPassword(signUpModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Map<String, dynamic>, Failure>> resetPassword(SignUpModel signUpModel) async{
    try {
      final result =
      await baseRemotelyDataSource.resetPassword(signUpModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either< String, Failure>> sendCode(SignUpModel signUpModel)async{
    try {
      final result =
      await baseRemotelyDataSource.sendCode(signUpModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Map<String, dynamic>, Failure>> verifyCode(SignUpModel signUpModel) async{
    try {
      final result =
      await baseRemotelyDataSource.verifyCode(signUpModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }


}
