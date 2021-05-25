import 'package:dartz/dartz.dart';
import 'package:forum_manha/core/configs/app_errors.dart';
import 'package:forum_manha/modules/register/models/user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class RegisterRepository {
  Future<Either<Failure, bool>> register(UserModel user) async {
    try {
      final parseUser = ParseUser.createUser(
        user.email.trim(),
        user.password.trim(),
        user.email.trim(),
      )
        ..set('name', user.name.trim())
        ..set('avatar', '');

      final response = await parseUser.signUp();
      if (response.success) {
        return const Right(true);
      }

      return Left(ServerError(response.error!.message));
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }
}
