import 'package:dartz/dartz.dart';
import 'package:forum_manha/core/configs/app_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProfileRepository {
  Future<Either<Failure, bool>> logout() async {
    try {
      final user = await ParseUser.currentUser();
      final response = await user.logout();
      if (response.success) {
        return const Right(true);
      } else {
        return Left(ServerError(response.error!.message));
      }
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }
}
