import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/views/vacina/drop_down_lista_vacinas.dart';

double alturaTela = 0;
double larguraTela = 0;
final vacinaController = Get.put(VacinaController());
registrarEditarVacinaAlerta(BuildContext context) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

/*
  if (!vacinaController.iniciouEdicao ||
      vacinaController.listaTodasVacinas.isEmpty) {
    vacinaController.buscarListaTodasVacinas();
  }
  */

  showDialog(
    context: context,
    //barrierColor: Color(0xFFF5F5F5),
    barrierColor: Color.fromRGBO(211, 211, 211, 0.4),

    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        //    insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        content: options(context),
      );
    },
  );
}

options(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
    ),
    height: alturaTela * 0.60,
    width: larguraTela * 0.8,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.bloodtype_outlined,
          color: Colors.indigo[400],
          size: alturaTela * 0.12,
        ),
        SizedBox(
          height: alturaTela * 0.005,
        ),
        Text(
          !vacinaController.iniciouEdicao
              ? "Cadastrar Vacina"
              : "Editar Vacina",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent[700]),
        ),
        SizedBox(
          height: alturaTela * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: SizedBox(
            width: larguraTela * 0.8,
            child: listaVacinasDropDown(context),
          ),
        ),
        SizedBox(
          height: alturaTela * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: SizedBox(
            width: larguraTela * 0.8,
            child: GestureDetector(
              child: TextFormField(
                controller: vacinaController.dataController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Data da vacina",
                  labelStyle: TextStyle(
                    fontSize: larguraTela * 0.04,
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                // onTap: () => _selecionarData(context),
              ),
              onTap: () => _selecionarData(context),
            ),
          ),
        ),
        SizedBox(
          height: alturaTela * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: Row(
            children: [
              Expanded(
                child: GetBuilder<VacinaController>(
                  builder: (controller) {
                    return controller.estaCadastrandoVacina
                        ? Column(
                            children: [
                              LinearProgressIndicator(),
                              Text('Cadastrando vacinas'),
                            ],
                          )
                        : TextButton.icon(
                            onPressed: () =>
                                controller.cadastrarVacinaUsuario(),
                            icon: FaIcon(
                              !vacinaController.iniciouEdicao
                                  ? FontAwesomeIcons.save
                                  : FontAwesomeIcons.sync,
                              color: Colors.white,
                              size: larguraTela * 0.035,
                            ),
                            label: Text(
                              !vacinaController.iniciouEdicao
                                  ? 'Cadastrar Vacina'
                                  : 'Atualizar Vacina', // Falta adicionar o icone

                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[400],
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

_selecionarData(BuildContext context) {
  // showDatePicker is a pre-made funtion of Flutter
  showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now())
      .then((pickedDate) {
    // Check if no date is selected
    if (pickedDate == null) {
      return;
    }
    vacinaController.setarDataselecionada(pickedDate);
  });
}
