import 'package:dartz/dartz.dart';
import 'package:forum_manha/core/configs/app_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ResetRepository {
  Future<Either<Failure, bool>> passwordReset(String email) async {
    try {
      final user = ParseUser(null, null, email.trim());
      final response = await user.requestPasswordReset();

      if (response.success) {
        return const Right(true);
      }

      return Left(ServerError(response.error!.message));
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }
}
