import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:higia/models/usuarioModel.dart';
import 'package:higia/repositorios/repositorio_usuarios.dart';
import 'package:higia/views/componentes_uso_geral/mySnackBar.dart';
import 'package:higia/views/home_view.dart';

class ControllerUsuario extends GetxController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(text: 'felipe@felipe');
  TextEditingController senhaController = TextEditingController(text: '123');
  TextEditingController confirmeSenhaController = TextEditingController();

  UsuarioModel usuarioLogado = UsuarioModel();
  bool estaLogando = false;
  bool estaRegistrando = false;

//TODO: Fazer validação dos campos!
  //### VALIDAÇÕES DOS CAMPOS ###

  validarNome() {
    estaRegistrando = true;
    update();

    if (nomeController.text.length < 7) {
      mySnackBar(
        'Ops',
        'O nome deve ter mais de 7 letras!',
        Icons.warning_amber_outlined,
        Colors.yellow,
      );
      estaRegistrando = false;
      update();
    } else {
      validarCpf();
    }
  }

  validarCpf() {
    if (!cpfController.text.isCpf) {
      mySnackBar(
        'Ops',
        'O CPF é inválido!',
        Icons.warning_amber_outlined,
        Colors.yellow,
      );
      estaRegistrando = false;
      update();
    } else {
      validarEmail();
    }
  }

  validarEmail() {
    if (!emailController.text.isEmail) {
      mySnackBar(
        'Ops',
        'O email informado é inválido',
        Icons.warning_amber_outlined,
        Colors.yellow,
      );
      estaRegistrando = false;
      update();
    } else {
      validarSenha();
    }
  }

  validarSenha() async {
    if ((senhaController.text == confirmeSenhaController.text) &&
        (senhaController.text.length >= 4)) {
      //verificar se o login já existe na base
      //validateNickName();
      registrarUsuario();
    } else {
      mySnackBar(
        'Ops!',
        'A senha e confirmação devem ser iguais e ter no mínimo 3 dígitos!',
        Icons.warning_amber_outlined,
        Colors.red,
      );
      estaRegistrando = false;
      update();
    }
  }

  registrarUsuario() async {
    estaRegistrando = true;
    update();
    UsuarioModel usuario = UsuarioModel(
      nome: nomeController.text,
      cpf: cpfController.text,
      email: emailController.text,
      senha: senhaController.text,
    );
    bool foiSalvo =
        await RepositorioUsuario().registrarUsuario(usuario);

    estaRegistrando = false;
    update();

    if (foiSalvo) {
      Get.back();
      mySnackBar(
          'Muito Bem', 'O usuário foi registrado!', Icons.check, Colors.green);
    } else {
      mySnackBar(
          'Ops', 'O usuário NÃO foi registrado!', Icons.error, Colors.red);
    }
  }

  validarLogin() async {
    //para o circular avatar
    estaLogando = true;
    update();

    UsuarioModel usuario = UsuarioModel(
      nome: nomeController.text,
      cpf: cpfController.text,
      email: emailController.text,
      senha: senhaController.text,
    );
    UsuarioModel usuarioRetornado =
        await RepositorioUsuario().validarUsuario(usuario);

    usuarioLogado = usuarioRetornado;

    //para o circular avatar
    estaLogando = false;
    update();

    if (usuarioRetornado.idUuid != 'no') {
      Get.to(() => HomeView());
      mySnackBar('Seja bem vindo(a)', '${usuarioRetornado.nome}', Icons.check,
          Colors.green);
    } else {
      mySnackBar('Ops', 'O usuário(${usuario.email}) não foi encontrado!',
          Icons.error, Colors.red);
    }
  }

  limparControllers() {}

  carregarUsuarioDoLoginSocial(User? usuario) {
    usuarioLogado = UsuarioModel(
      nome: usuario!.displayName,
      email: usuario.email,
      urlImagemPerfil: usuario.photoURL,
    );

    Get.back();

    Get.to(() => HomeView());

    update();
  }
}
