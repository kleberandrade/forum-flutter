import 'package:dartz/dartz.dart';
import 'package:forum_manha/modules/profile/models/current_user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../../core/configs/app_errors.dart';

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

  Future<Either<Failure, CurrentUserModel>> getCurrentUserData() async {
    try {
      final response = await ParseUser.currentUser();
      final result = CurrentUserModel.fromMap(response);
      return Right(result);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }
}
