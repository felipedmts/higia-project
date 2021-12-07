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
Widget listaTiposSanguineosDropDown(BuildContext context) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

  return GetBuilder<ControllerUsuario>(builder: (controller) {
    return controller.listaTiposSanguineo.isEmpty
        ? Column(
            children: [
              LinearProgressIndicator(),
              Text('Carregando tipos sanguineos...'),
            ],
          )
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Selecione o tipo sanguineo'),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<TiposSanguineo>(
                      elevation: 5,
                      isExpanded: true,
                      hint: Text("Selecione o tipo"),
                      value: controller
                          .tiposSanguineoSelecionadoNoDrop, //value: _value1.isNotEmpty ? _value1 : null,
                      itemHeight: alturaTela * 0.10,
                      onChanged: (TiposSanguineo? vacinaSelec) {
                        controllerUsuario.setarTipoSanguineo(vacinaSelec);
                      },
                      items: controllerUsuario.listaTiposSanguineo
                          .map((TiposSanguineo tipo) {
                        return DropdownMenuItem<TiposSanguineo>(
                          value: tipo,
                          child: _listaExpandivelTiposSanguineos(tipo),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
  });
}

Widget _listaExpandivelTiposSanguineos(TiposSanguineo tipo) {
  return SingleChildScrollView(
    child: ExpansionTile(
      title: SizedBox(
        // height: alturaTela * 0.20,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: larguraTela * 0.10,
              width: larguraTela * 0.10,
              child: CircleAvatar(
                child: Image.network(
                  '${tipo.urlImageType}',
                  height: larguraTela * 0.10,
                  width: larguraTela * 0.10,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      children: <Widget>[
        SizedBox(
          //   height: alturaTela * 0.15,
          child: ListTile(
            title: Column(
              children: [
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.arrowAltCircleLeft,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: larguraTela * 0.01,
                    ),
                    Text(
                      tipo.recebeDe!,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.arrowAltCircleRight,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: larguraTela * 0.01,
                    ),
                    Expanded(
                      child: Text(
                        tipo.doaPara!,
                        style: TextStyle(color: Colors.black),
                        //  textAlign: TextAlign.,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
