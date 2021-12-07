import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/exame_controllers.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/models/exame_model.dart';
import 'package:higia/models/vacina_model.dart';

double alturaTela = 0;
double larguraTela = 0;
final exameController = Get.put(ExameController());
Widget listaExamesDropDown(BuildContext context) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

  return GetBuilder<ExameController>(builder: (controller) {
    return controller.listaTodosExames.isEmpty ||
            controller.exameSelecionadaNoDropDown == null
        ? Column(
            children: [
              LinearProgressIndicator(),
              Text('Carregando exames'),
            ],
          )
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ExameModel>(
                  elevation: 5,
                  isExpanded: true,
                  hint: Text("Selecione o exame"),
                  value: controller
                      .exameSelecionadaNoDropDown, //value: _value1.isNotEmpty ? _value1 : null,
                  itemHeight: alturaTela * 0.10,
                  onChanged: (ExameModel? exameSelec) {
                    exameController
                        .setarExameSelecionadaNoDropDown(exameSelec);
                  },
                  items: exameController.listaTodosExames
                      .map((ExameModel exame) {
                    return DropdownMenuItem<ExameModel>(
                      value: exame,
                      child: _listaExpandivelVacina(exame),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  });
}

Widget _listaExpandivelVacina(ExameModel exame) {
  return SingleChildScrollView(
    child: ExpansionTile(
      title: SizedBox(
        // height: alturaTela * 0.20,
        child: Row(
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.syringe,
              color: Colors.blue,
              size: larguraTela * 0.05,
            ),
            SizedBox(
              width: larguraTela * 0.02,
            ),
            Expanded(
              child: Text(
                exame.nome!,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      children: <Widget>[
        SizedBox(
          //   height: alturaTela * 0.15,
          child: Card(
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.calendar,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: larguraTela * 0.01,
                      ),
                      Text(
                        exame.paraSexo!,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.book,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: larguraTela * 0.01,
                      ),
                      Expanded(
                        child: Text(
                          exame.descricao!,
                          style: TextStyle(color: Colors.black),
                          //  textAlign: TextAlign.,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
