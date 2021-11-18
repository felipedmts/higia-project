import 'package:flutter/material.dart';
import 'package:higia/views/home_view.dart';


import 'views/tela_cadastro.dart';
import 'views/tela_login.dart';

void main(){

runApp(MaterialApp(
  title: 'OLA',
  home: HomeView(),
  //home: TelaLogin(),
  // home: TelaCadastro(),
    //home: TelaInicialPerfil(),
  debugShowCheckedModeBanner: false,
));

}