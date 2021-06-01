import 'package:dartz/dartz.dart';
import 'package:forum_manha/core/configs/app_errors.dart';
import 'package:forum_manha/modules/reset/repositories/reset_repository.dart';
import 'package:mobx/mobx.dart';

part 'reset_controller.g.dart';

class ResetController = _ResetControllerBase with _$ResetController;

abstract class _ResetControllerBase with Store {
  final ResetRepository _repository;

  _ResetControllerBase(this._repository);

  @observable
  String email = '';

  @action
  void setEmail(value) => email = value;

  @action
  Future<Either<Failure, bool>> passwordReset() async {
    return await _repository.passwordReset(email);
  }
}
