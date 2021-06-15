import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/configs/app_errors.dart';
import '../models/credential_model.dart';
import '../models/user_model.dart';
import '../repositories/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository _repository;

  _LoginControllerBase(this._repository);

  @observable
  String email = '';

  @action
  void setEmail(value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(value) => password = value;

  @action
  Future<Either<Failure, UserModel>> login() async {
    final credential = CredentialModel(
      email: email,
      password: password,
    );

    return await _repository.login(credential);
  }
}
