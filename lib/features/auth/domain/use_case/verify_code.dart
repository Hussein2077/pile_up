import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/auth/domain/repo/base_repo.dart';
import 'package:pile_up/features/auth/domain/use_case/sign_up_use_case.dart';
class VerifyCodeUseCase
    extends BaseUseCase<Map<String, dynamic>, SignUpModel> {
  BaseRepository baseRepository;

  VerifyCodeUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      SignUpModel parameter) async {
    final result = await baseRepository.verifyCode(parameter);

    return result;
  }
}