import 'package:forum_manha/modules/profile/repositories/profile_repository.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final ProfileRepository _repository;

  _ProfileControllerBase(this._repository);

  @observable
  String name = 'Kleber de Oliveira Andrade';

  @observable
  String email = 'pdjkleber@gmail.com';

  @observable
  String pictureUrl = '';

  @action
  Future logout() async {
    return await _repository.logout();
  }
}
