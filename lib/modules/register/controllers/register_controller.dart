import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/configs/app_errors.dart';
import '../models/user_model.dart';
import '../repositories/register_repository.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterRepository _repository;

  _RegisterControllerBase(this._repository);

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @action
  void setName(value) => name = value;

  @action
  void setEmail(value) => email = value;

  @action
  void setPassword(value) => password = value;

  @action
  void setConfirmPassword(value) => confirmPassword = value;

  @action
  Future<Either<Failure, bool>> register() async {
    final user = UserModel(name: name, email: email, password: password);
    return await _repository.register(user);
  }
}
