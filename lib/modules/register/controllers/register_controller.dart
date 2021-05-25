import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
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
}
