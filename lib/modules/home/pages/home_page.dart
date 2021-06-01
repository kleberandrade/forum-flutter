import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/modules/home/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.selectItem(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: controller.selectItem,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'tópicos',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'conta',
          ),
        ],
      );
    });
  }
}
