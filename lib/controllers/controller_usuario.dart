import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:higia/models/usuarioModel.dart';
import 'package:higia/repositorios/repositorio_registrar_usuarios.dart';
import 'package:higia/views/componentes_uso_geral/mySnackBar.dart';

class ControllerUsuario extends GetxController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmeSenhaController = TextEditingController();

//TODO: Fazer validação dos campos!
  validarCampos() {}

  registrarUsuario() async {
    UsuarioModel usuario = UsuarioModel(
      nome: nomeController.text,
      cpf: cpfController.text,
      email: emailController.text,
      senha: senhaController.text,
    );
    bool foiSalvo =
        await RepositorioRegistrarUsuarios().registrarUsuario(usuario);

    if (foiSalvo) {
      Get.back();
      mySnackBar(
          'Muito Bem', 'O usuário foi registrado!', Icons.check, Colors.green);
    } else {
      mySnackBar(
          'Ops', 'O usuário NÃO foi registrado!', Icons.error, Colors.red);
    }
  }

  limparControllers() {}
}
