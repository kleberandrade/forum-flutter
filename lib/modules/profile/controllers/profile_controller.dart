import 'package:mobx/mobx.dart';

import '../repositories/profile_repository.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final ProfileRepository _repository;

  _ProfileControllerBase(this._repository);

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String avatar = '';

  @action
  Future<void> getCurrentUserData() async {
    final result = await _repository.getCurrentUserData();
    result.fold((_) => null, (user) {
      name = user.name;
      email = user.email;
      avatar = user.avatar;
    });
  }

  @action
  Future logout() async {
    return await _repository.logout();
  }
}
