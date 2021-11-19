import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/views/home_view.dart';

import 'views/tela_cadastro.dart';
import 'views/tela_login.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'OLA',
    home: HomeView(),
    //home: TelaLogin(),
    // home: TelaCadastro(),
    //home: TelaInicialPerfil(),
    debugShowCheckedModeBanner: false,
  ));
}
