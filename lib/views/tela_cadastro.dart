import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/views/tela_login.dart';

class TelaCadastro extends StatelessWidget {
  final controllerUsuario = Get.put(ControllerUsuario());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.centerRight,
            begin: Alignment.topRight,
            colors: [
              //Color(0xff38eeff),
              //Color(0xff38eeff),

              Color(0xffACD2ff),
              Color(0x00246eb9),
              Color(0x00246eb9),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 175,
              ),
              SizedBox(
                width: 50,
              ),
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cadastro",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Que bom ter você aqui!",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                child: Container(
                  //color: Colors.red,
                  width: 400,
                  height: 65,
                  child: TextFormField(
                    controller: controllerUsuario.nomeController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "    Nome Completo:",
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 400,
                height: 60,
                child: TextFormField(
                  controller: controllerUsuario.cpfController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "    CPF:",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 400,
                height: 60,
                child: TextFormField(
                  controller: controllerUsuario.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "    Email:",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 400,
                height: 60,
                child: TextFormField(
                  controller: controllerUsuario.senhaController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "    Senha:",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 400,
                height: 60,
                child: TextFormField(
                  controller: controllerUsuario.confirmeSenhaController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "    Confirmar Senha:",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 180,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => controllerUsuario.registrarUsuario(),
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadiusDirectional.circular(30.0),
                    ),
                    primary: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () => Get.to(() => TelaLogin()),
                child: Text(
                  "Fazer Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                child: Text("Ja tem conta? entre nela agora mesmo"),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
