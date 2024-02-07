import 'package:dartz/dartz.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/models/my_data_model.dart';
import 'package:pile_up/features/auth/domain/repo/base_repo.dart';

class SignUpWithEmailAndPasswordUseCase
    extends BaseUseCase<MyDataModel, SignUpModel> {
  BaseRepository baseRepository;

  SignUpWithEmailAndPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<MyDataModel, Failure>> call(SignUpModel parameter) async {
    final result = await baseRepository.signUpWithEmailAndPassword(parameter);

    return result;
  }
}

class SignUpModel {
  final String email;
  final String password;
  final String? name;
  final String? phone;
  final String? dateOfBirth;
  final String? eduLevel;
  final String? gradLevel;
  final String? university;
  final String? major;

  SignUpModel({
    required this.email,
    required this.password,
    this.name,
    this.phone,
    this.dateOfBirth,
    this.eduLevel,
    this.gradLevel,
    this.university,
    this.major,
  });
}
