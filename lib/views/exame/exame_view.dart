import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/controllers/exame_controllers.dart';
import 'package:higia/generalUse/my_formate_date.dart';
import 'package:higia/models/usuario_exame_model.dart';
import 'package:higia/views/componentes_uso_geral/info_perfil.dart';
import 'package:higia/views/exame/registrar_editar_exame_alerta.dart';
import 'package:lottie/lottie.dart';

class ExamesView extends StatelessWidget {
  /*
  @override
  int get hashCode => super.hashCode;
  */
  final controllerUsuario = Get.put(ControllerUsuario());
  final exameController = Get.put(ExameController());
  double alturaTela = 0;
  double larguraTela = 0;
  @override
  Widget build(BuildContext context) {
    alturaTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;
    exameController.initSubscriptionCarregarListaExamesPorUsuario();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(top: alturaTela * 0.03),
          child: SingleChildScrollView(
            child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                inforPerfil(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Lottie.asset(
                      'assets/lottie_animations/exame.json',
                      height: 100,
                      width: 100,
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
                                  "MEUS EXAMES",
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
                                      exameController.iniciouEdicao = false;
                                      exameController.urlImagemFotoVacina =
                                          'no';
                                      exameController.buscarListaTodosExames(
                                        'registrar',
                                      );
                                      registrarEditarExameAlerta(context);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'Adicionar Exames', // Falta adicionar o icone

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
                  child: GetBuilder<ExameController>(
                    builder: (controller) {
                      return controller.listaExamesPorUsuario!.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearProgressIndicator(),
                                  Text('Buscando exames...'),
                                ],
                              ),
                            )
                          : GridView.count(
                              //childAspectRatio: 3 / 3,
                              crossAxisCount: 3,
                              children: List.generate(
                                controller.listaExamesPorUsuario!.length,
                                (index) {
                                  UsuarioExameModel usuarioExame =
                                      controller.listaExamesPorUsuario![index];
                                  return cartaoModel(usuarioExame, context);
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

  Widget cartaoModel(UsuarioExameModel usuarioExame, BuildContext context) {
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
                    '${usuarioExame.exame!.nome}',
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: larguraTela * 0.035,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${myFormateDateNoHour(usuarioExame.dataExame)}',
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
                              exameController.setarExameSelecionadaParaEdicao(
                                  usuarioExame, context);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.edit,
                              color: Colors.white,
                              size: larguraTela * 0.035,
                            ),
                            label: Text(
                              'Editar',

                              style: TextStyle(
                                fontSize: larguraTela * 0.025,
                                color: Colors.white,
                              ),
                              // textAlign: TextAlign.center,
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
