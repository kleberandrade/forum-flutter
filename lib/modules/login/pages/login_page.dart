import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/core/helpers/snackbar_helper.dart';
import 'package:forum_manha/core/widgets/appbars/simple_appbar.dart';
import 'package:forum_manha/core/widgets/buttons/primary_button.dart';
import 'package:forum_manha/core/widgets/buttons/secondary_button.dart';
import 'package:forum_manha/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum_manha/core/widgets/forms/email_input_field.dart';
import 'package:forum_manha/core/widgets/forms/form_scaffold.dart';
import 'package:forum_manha/core/widgets/forms/password_input_field.dart';
import 'package:forum_manha/modules/login/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      formKey: _formKey,
      appBar: const SimpleAppBar(title: 'Login'),
      children: [
        EmailInputField(
          label: 'Email',
          initialValue: controller.email,
          onSaved: controller.setEmail,
        ),
        PasswordInputField(
          label: 'Senha',
          initialValue: controller.password,
          onSaved: controller.setPassword,
        ),
        PrimaryButton(label: 'Entrar', onPressed: _onLogin),
        SecondaryButton(label: 'Registrar', onPressed: _onRegister),
      ],
    );
  }

  void _onRegister() {
    Modular.to.pushNamed('/register');
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;
    LoadingDialog.show(context, message: 'Verificando credenciais');
    _formKey.currentState!.save();
    final result = await controller.login();
    LoadingDialog.hide();
    result.fold(_onFailure, _onSuccess);
  }

  void _onFailure(failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.toString());
  }

  void _onSuccess(user) {
    SnackBarHelper.showSuccessMessage(context, message: 'Sucesso!');
    //Modular.to.navigate('/home');
  }
}
