import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../../core/configs/app_errors.dart';
import '../models/credential_model.dart';
import '../models/user_model.dart';

class LoginRepository {
  Future<Either<Failure, UserModel>> login(CredentialModel credential) async {
    try {
      final user = ParseUser(
        credential.email.trim(),
        credential.password.trim(),
        credential.email.trim(),
      );

      final response = await user.login();
      if (response.success) {
        final data = response.results!.first;
        final result = UserModel.fromMap(data);
        return Right(result);
      }

      return Left(ServerError('Email ou senha inválido'));
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }
}
