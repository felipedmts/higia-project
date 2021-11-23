import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_camera.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/views/alergias/resistroAlergiaAlerta.dart';
import 'package:higia/views/vacina/registro_vacina_alerta.dart';

class VacinaView extends StatelessWidget {
  final controllerUsuario = Get.put(ControllerUsuario());
  double alturaTela = 0;
  double larguraTela = 0;
  @override
  Widget build(BuildContext context) {
    alturaTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: larguraTela * 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 100),
                    ),
                    GetBuilder<ControllerCamera>(
                      builder: (controller) {
                        return controllerUsuario
                                        .usuarioLogado.urlImagemPerfil !=
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
                    SizedBox(
                      width: larguraTela * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controllerUsuario.usuarioLogado.nome}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.indigo[300]),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topLeft,
                          ),
                          onPressed: () {},
                          child: Text(
                            "VER PERFIL",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        width: larguraTela * 0.33,
                        height: alturaTela * 0.15,
                      ),
                      //SizedBox(
                      //  height: 40,
                      // ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: alturaTela * 0.02,
              ),
              Container(
                width: larguraTela * 0.50,
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
                      "VACINAS E REFORÇO",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: alturaTela * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(left: larguraTela * 0.05),
                child: Row(
                  children: [
                    SizedBox(
                        width: larguraTela * 0.30,
                        height: alturaTela * 0.05,
                        child: TextButton.icon(
                          onPressed: () => registroVacinaAlerta(context),
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
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: larguraTela * 0.010,
              ),
              SizedBox(
                height: alturaTela * 0.45,
                width: larguraTela * 0.85,
                child: GridView.count(
                  //childAspectRatio: 3 / 3,
                  crossAxisCount: 3,
                  children: List.generate(
                    12,
                    (index) {
                      return cartaoModel();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cartaoModel() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: larguraTela * 0.20,
        height: alturaTela * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                child: Icon(Icons.thermostat_outlined),
              ),
              Text(
                "Sarampo",
                style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "30/10/2021",
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
