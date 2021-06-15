import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_errors.dart';
import '../../../core/helpers/snackbar_helper.dart';
import '../../../core/widgets/dialogs/loading_dialog.dart';
import '../../../core/widgets/dialogs/logout_dialog.dart';
import '../../../core/widgets/tiles/action_tile.dart';
import '../controllers/profile_controller.dart';
import '../widgets/account_header_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  @override
  void initState() {
    super.initState();
    controller.getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        child: Column(
          children: [
            Observer(builder: (_) {
              return ProfileHeaderTile(
                name: controller.name,
                email: controller.email,
                pictureUrl: controller.avatar,
              );
            }),
            const Divider(color: AppColors.white),
            _buildPersonDataTile(),
            _buildNotificationTile(),
            _buildFaqTile(),
            _buildSettingsTile(),
            const Divider(color: AppColors.white),
            _buildPrvacyPolicyTile(),
            _buildAboutTile(),
            const Divider(color: AppColors.white),
            _buildLogoutTile(),
          ],
        ),
      ),
    );
  }

  ActionTile _buildPrvacyPolicyTile() {
    return ActionTile.next(
      title: 'Política de Privacidade',
      prefixIcon: Icons.verified_user_outlined,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildPersonDataTile() {
    return ActionTile.next(
      title: 'Dados pessoais',
      prefixIcon: Icons.person_outline,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildNotificationTile() {
    return ActionTile.next(
      title: 'Notificações',
      prefixIcon: Icons.notifications_none_outlined,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildSettingsTile() {
    return ActionTile.next(
      title: 'Configurações',
      prefixIcon: Icons.settings_outlined,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildFaqTile() {
    return ActionTile.next(
      title: 'Dúvidas',
      prefixIcon: Icons.help_outline,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildAboutTile() {
    return ActionTile.next(
      title: 'Sobre o app',
      prefixIcon: Icons.info_outline,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildLogoutTile() {
    return ActionTile(
      title: 'Sair',
      prefixIcon: Icons.exit_to_app_outlined,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: _onLogout,
    );
  }

  Future _onLogout() async {
    final result = await LogoutDialog.show(context);
    if (result) {
      LoadingDialog.show(context, message: 'Desconectando...');
      final result = await controller.logout();
      LoadingDialog.hide();
      result.fold(_onLogoutFailure, _onLogoutSuccess);
    }
  }

  void _onLogoutFailure(Failure failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.message);
  }

  void _onLogoutSuccess(bool success) {
    Modular.to.navigate('/login');
  }
}
