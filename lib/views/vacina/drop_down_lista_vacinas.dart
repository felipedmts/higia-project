import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/models/vacina_model.dart';

double alturaTela = 0;
double larguraTela = 0;
final vacinaController = Get.put(VacinaController());
Widget listaVacinasDropDown(BuildContext context) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

  return GetBuilder<VacinaController>(builder: (controller) {
    return controller.listaTodasVacinas.isEmpty ||
            controller.vacinaSelecionadaNoDropDown == null
        ? Column(
            children: [
              LinearProgressIndicator(),
              Text('Carregando vacinas'),
            ],
          )
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<VacinaModel>(
                  elevation: 5,
                  isExpanded: true,
                  hint: Text("Selecione a vacina"),
                  value: controller
                      .vacinaSelecionadaNoDropDown, //value: _value1.isNotEmpty ? _value1 : null,
                  itemHeight: alturaTela * 0.10,
                  onChanged: (VacinaModel? vacinaSelec) {
                    vacinaController
                        .setarVacinaSelecionadaNoDropDown(vacinaSelec);
                  },
                  items: vacinaController.listaTodasVacinas
                      .map((VacinaModel vacina) {
                    return DropdownMenuItem<VacinaModel>(
                      value: vacina,
                      child: _listaExpandivelVacina(vacina),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  });
}

Widget _listaExpandivelVacina(VacinaModel vacina) {
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
                vacina.nome!,
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
                        vacina.faixaEtaria!,
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
                          vacina.descricaoServentia!,
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
