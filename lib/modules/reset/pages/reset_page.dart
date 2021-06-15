import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/helpers/snackbar_helper.dart';
import '../../../core/widgets/appbars/simple_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/dialogs/loading_dialog.dart';
import '../../../core/widgets/forms/email_input_field.dart';
import '../../../core/widgets/forms/form_scaffold.dart';
import '../controllers/reset_controller.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends ModularState<ResetPage, ResetController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      appBar: const SimpleAppBar(title: 'Reiniciar senha'),
      formKey: _formKey,
      children: [
        EmailInputField(
          label: 'Email',
          initialValue: controller.email,
          onSaved: controller.setEmail,
        ),
        PrimaryButton(
          label: 'Enviar email',
          onPressed: _onPasswordReset,
        )
      ],
    );
  }

  Future<void> _onPasswordReset() async {
    if (!_formKey.currentState!.validate()) return;
    LoadingDialog.show(context, message: 'Verificando email');
    _formKey.currentState!.save();
    final result = await controller.passwordReset();
    LoadingDialog.hide();
    result.fold(_onFailure, _onSuccess);
  }

  void _onFailure(failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.toString());
  }

  void _onSuccess(user) {
    Modular.to.pop();
    SnackBarHelper.showSuccessMessage(context, message: 'Sucesso!');
  }
}
