import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/generalUse/my_formate_date.dart';
import 'package:higia/models/usuario_vacina_model.dart';
import 'package:higia/views/componentes_uso_geral/info_perfil.dart';
import 'package:higia/views/vacina/registrar_editar_vacina_alerta.dart';
import 'package:lottie/lottie.dart';

class VacinaView extends StatelessWidget {
  @override
  final controllerUsuario = Get.put(ControllerUsuario());
  final vacinaController = Get.put(VacinaController());
  double alturaTela = 0;
  double larguraTela = 0;
  @override
  Widget build(BuildContext context) {
    alturaTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;
    vacinaController.initSubscriptionCarregarListaVacinasPorUsuario();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(top: alturaTela * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                inforPerfil(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: larguraTela * 0.25,
                      width: larguraTela * 0.25,
                      child: Lottie.asset(
                        'assets/lottie_animations/vacina.json',
                        height: 100,
                        width: 100,
                        repeat: true
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: larguraTela * 0.03,
                            left: larguraTela * 0.03,
                          ),
                          child: Container(
                            width: larguraTela * 0.60,
                            height: alturaTela * 0.05,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(30),
                              color: Colors.blue[800],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "MINHAS VACINAS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: larguraTela * 0.03,
                              left: larguraTela * 0.03),
                          child: SizedBox(
                            width: larguraTela * 0.60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton.icon(
                                    onPressed: () {
                                      vacinaController.iniciouEdicao = false;
                                      vacinaController.urlImagemFotoVacina =
                                          'no';
                                      vacinaController.buscarListaTodasVacinas(
                                        'registrar',
                                      );
                                      registrarEditarVacinaAlerta(context);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'Adicionar Vacinas', // Falta adicionar o icone

                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green[400],
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: alturaTela * 0.45,
                  // width: larguraTela * 0.85,
                  child: GetBuilder<VacinaController>(
                    builder: (controller) {
                      return controller.listaVacinasPorUsuario!.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearProgressIndicator(),
                                  Text('Buscando vacinas...'),
                                ],
                              ),
                            )
                          : GridView.count(
                              //childAspectRatio: 3 / 3,
                              crossAxisCount: 3,
                              children: List.generate(
                                controller.listaVacinasPorUsuario!.length,
                                (index) {
                                  UsuarioVacinaModel vacina =
                                      controller.listaVacinasPorUsuario![index];
                                  return cartaoModel(vacina, context);
                                },
                              ),
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cartaoModel(UsuarioVacinaModel vacina, BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: larguraTela * 0.20,
        height: alturaTela * 0.15,
        child: Padding(
          padding: EdgeInsets.all(larguraTela * 0.02),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.thermostat_outlined,
                      size: larguraTela * 0.08,
                    ),
                  ),
                  Text(
                    '${vacina.vacina!.nome}',
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: larguraTela * 0.035,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${myFormateDateNoHour(vacina.dataVacinacao)}',
                    style: TextStyle(
                      color: Colors.green[400],
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: alturaTela * 0.035,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {
                              vacinaController.setarVacinaSelecionadaParaEdicao(
                                  vacina, context);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.edit,
                              color: Colors.white,
                              size: larguraTela * 0.035,
                            ),
                            label: Text(
                              'Editar', // Falta adicionar o icone

                              style: TextStyle(
                                fontSize: larguraTela * 0.025,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.e,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[400],
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(
                                    larguraTela * 0.05),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
