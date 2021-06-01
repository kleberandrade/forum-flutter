import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  static const kModules = {
    0: '/home/posts',
    1: '/home/profile',
  };

  @observable
  int currentIndex = 0;

  @action
  void selectItem(int index) {
    currentIndex = index;
    final module = kModules[currentIndex];
    Modular.to.navigate(module!);
  }
}
