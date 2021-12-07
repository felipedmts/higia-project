import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/models/usuarioModel.dart';
import 'package:higia/models/vacina_model.dart';

double alturaTela = 0;
double larguraTela = 0;
final controllerUsuario = Get.put(ControllerUsuario());
Widget listaSexosDropDown(BuildContext context) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

  return GetBuilder<ControllerUsuario>(builder: (controller) {
    return controller.listaTiposSanguineo.isEmpty
        ? Column(
            children: [
              LinearProgressIndicator(),
              Text('Carregando sexos..'),
            ],
          )
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Selecione o Sexo'),
                  DropdownButton<Sexo>(
                    elevation: 5,
                    isExpanded: true,
                    hint: Text("Selecione o sexo"),
                    value: controller.sexoSelecionadoNoDrop,
                    itemHeight: alturaTela * 0.10,
                    onChanged: (Sexo? vacinaSelec) {
                      controllerUsuario.setarSexo(vacinaSelec);
                    },
                    items: controllerUsuario.listaSexos.map((Sexo sexo) {
                      return DropdownMenuItem<Sexo>(
                        value: sexo,
                        child: _listaSexos(sexo),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
  });
}

Widget _listaSexos(Sexo sexo) {
  IconData icon;
  if (sexo.nome == 'Masc') {
    icon = FontAwesomeIcons.male;
  } else {
    icon = FontAwesomeIcons.female;
  }
  return SingleChildScrollView(
    child: SizedBox(
      //   height: alturaTela * 0.15,
      child: Row(
        children: <Widget>[
          FaIcon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(
            width: larguraTela * 0.01,
          ),
          Text(
            sexo.nome!,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
