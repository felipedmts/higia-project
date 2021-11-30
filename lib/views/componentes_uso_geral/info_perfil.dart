import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_camera.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/generalUse/my_count%20age.dart';

Widget inforPerfil(BuildContext context) {
  final controllerUsuario = Get.put(ControllerUsuario());
  final controllerCamera = Get.put(ControllerCamera());

  double alturaTela = MediaQuery.of(context).size.height;
  double larguraTela = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.only(
      top: alturaTela * 0.02,
      right: larguraTela * 0.035,
      left: larguraTela * 0.035,
    ),
    child: SizedBox(
      width: larguraTela,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: GetBuilder<ControllerCamera>(
                  builder: (controller) {
                    return controllerUsuario.usuarioLogado.urlImagemPerfil !=
                                'no' &&
                            controller.fotoCapturada == null
                        ? CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                controllerUsuario
                                    .usuarioLogado.urlImagemPerfil!,
                                width: larguraTela * 0.1,
                                height: larguraTela * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : controller.fotoCapturada == null
                            ? CircleAvatar(
                                child: Icon(Icons.person),
                              )
                            : CircleAvatar(
                                // radius: 30,
                                child: ClipOval(
                                  child: Image.file(
                                    controller.fotoCapturada!,
                                    width: larguraTela * 0.1,
                                    height: larguraTela * 0.1,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                  },
                ),
                onTap: () => controllerCamera.fotoDaCamera('perfilUsuario'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${controllerUsuario.usuarioLogado.nome}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.indigo[300]),
                  ),
                  Text(
                    'IDADE: ${myCountAge(controllerUsuario.usuarioLogado.dataNascimento)} ANOS',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  Text(
                    'SEXO: ${controllerUsuario.usuarioLogado.sexo!.descricao}',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'TIPO SANGUÍNEO',
                      style: TextStyle(
                          fontSize: larguraTela * 0.02,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    Image.network(
                      controllerUsuario
                          .usuarioLogado.tiposSanguineo!.urlImageType!,
                      width: larguraTela * 0.1,
                      height: larguraTela * 0.1,
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    ),
  );
}
