import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/core/configs/app_errors.dart';
import 'package:forum_manha/core/helpers/snackbar_helper.dart';
import 'package:forum_manha/core/widgets/appbars/simple_appbar.dart';
import 'package:forum_manha/core/widgets/buttons/primary_button.dart';
import 'package:forum_manha/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum_manha/core/widgets/forms/form_scaffold.dart';
import 'package:forum_manha/core/widgets/forms/text_area_input_field.dart';
import 'package:forum_manha/core/widgets/forms/text_input_field.dart';
import 'package:forum_manha/modules/posts/controllers/posts_editor_controller.dart';

class PostsEditorPage extends StatefulWidget {
  const PostsEditorPage({Key? key}) : super(key: key);

  @override
  _PostsEditorPageState createState() => _PostsEditorPageState();
}

class _PostsEditorPageState
    extends ModularState<PostsEditorPage, PostsEditorController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      appBar: const SimpleAppBar(title: 'Nova mensagem'),
      formKey: _formKey,
      children: [
        TextInputField(
          label: 'Título',
          initialValue: controller.title,
          onSaved: controller.setTitle,
        ),
        TextAreaInputField(
          label: 'Descrição',
          initialValue: controller.description,
          onSaved: controller.setDescription,
        ),
        PrimaryButton(
          label: 'Salvar',
          onPressed: _onSave,
        ),
      ],
    );
  }

  Future<void> _onSave() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LoadingDialog.show(context, message: 'Salvando...');
      final result = await controller.save();
      LoadingDialog.hide();
      result.fold(_onFailure, _onSuccess);
    }
  }

  void _onFailure(Failure failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.toString());
  }

  void _onSuccess(bool success) {
    if (success) {
      Modular.to.pop();
      /*
      SnackBarHelper.showSuccessMessage(
        context,
        message: 'Dúvida criada com sucesso',
      );
      */
    } else {
      SnackBarHelper.showFailureMessage(
        context,
        message: 'Problema ao tenta criar nova dúvida.',
      );
    }
  }
}
