import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/views/alergias/resistroAlergiaAlerta.dart';
import 'package:higia/views/cadastro/drop_down_lista_sexos.dart';
import 'package:higia/views/cadastro/drop_down_lista_tipos_sanguineos.dart';
import 'package:higia/views/login_view.dart';

double alturaTela = 0;
double larguraTela = 0;

class CadastroView extends StatelessWidget {
  final controllerUsuario = Get.put(ControllerUsuario());

  @override
  Widget build(BuildContext context) {
    alturaTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;

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
          child: Padding(
            padding: EdgeInsets.only(
              right: larguraTela * 0.03,
              left: larguraTela * 0.03,
            ),
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
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cadastro",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
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
                    width: double.infinity,
                    height: 65,
                    child: TextFormField(
                      key: controllerUsuario.formKeyNomeController,
                      controller: controllerUsuario.nomeController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "    Nome Completo:",
                        labelStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600),
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
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: listaTiposSanguineosDropDown(context),
                      ),
                      SizedBox(
                        width: larguraTela * 0.03,
                      ),
                      Expanded(
                        child: listaSexosDropDown(context),
                        /*
                        TextFormField(
                          controller: controllerUsuario.sexoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Sexo:',
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade600),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        */
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: larguraTela,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: controllerUsuario.formKeyCpfController,
                          controller: controllerUsuario.cpfController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "    CPF:",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade600),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            
                          ),
                          
                          inputFormatters: [
                            // obrigatório
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                        ),

                        /* TextFormField(
                          controller: controllerUsuario.tipoSanguineoController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Tipo Sanguineo:",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade600),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        */
                      ),
                      SizedBox(
                        width: larguraTela * 0.03,
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: GetBuilder<ControllerUsuario>(
                            builder: (_) {
                              return TextFormField(
                                controller:
                                    controllerUsuario.dataNascimentoController,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.start,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: "Data de Nascimento",
                                  labelStyle: TextStyle(
                                    fontSize: larguraTela * 0.03,
                                    color: Colors.grey.shade600,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  prefixIcon: FaIcon(
                                    FontAwesomeIcons.calendarCheck,
                                    color: Colors.green,
                                    size: larguraTela * 0.05,
                                  ),
                                ),
                                // onTap: () => _selecionarData(context),
                              );
                            },
                          ),
                          onTap: () => _selecionarData(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    key: controllerUsuario.formKeyEmailController,
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
                Container(
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    key: controllerUsuario.formKeySenhaController,
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
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: TextFormField(
                    key: controllerUsuario.formKeyConfirmeSenhaController,
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
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 180,
                  height: 45,
                  child: GetBuilder<ControllerUsuario>(
                    builder: (controller) {
                      return controllerUsuario.estaRegistrando
                          ? Column(
                              children: [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()),
                                Text('Cadastrando...')
                              ],
                            )
                          : ElevatedButton(
                              onPressed: () => controllerUsuario.validarNome(),
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(fontSize: 22),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadiusDirectional.circular(
                                          30.0),
                                ),
                                primary: Colors.green,
                              ),
                            );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () => Get.to(() => LoginView()),
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
      ),
    );
  }

  _selecionarData(BuildContext context) {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      controllerUsuario.setarDataNascimento(pickedDate);
    });
  }
}
