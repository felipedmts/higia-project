import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_camera.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/views/alergias/alergias_view.dart';
import 'package:higia/views/vacina/vacina_view.dart';

class HomeView extends StatelessWidget {
  final controllerUsuario = Get.put(ControllerUsuario());
  final controllerCamera = Get.put(ControllerCamera());

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
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: alturaTela * 0.02),
                  child: SizedBox(
                    width: 400,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25, top: 100),
                        ),
                        GestureDetector(
                          child: GetBuilder<ControllerCamera>(
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
                          onTap: () => controllerCamera.fotoDaCamera(),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                          width: 200,
                        ),
                        //SizedBox(
                        //  height: 40,
                        // ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(Icons.copy, 'Vacinas'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(
                        Icons.device_thermostat_outlined, 'Alergias'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(Icons.recent_actors_rounded, 'Genética'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(Icons.control_point, 'Doenças'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(
                        Icons.quick_contacts_dialer_rounded, 'Contatos'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(
                        Icons.family_restroom_outlined, 'Hist. Família'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(Icons.content_paste_sharp, 'Exames'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(Icons.qr_code_2_sharp, 'Hist. QR. Code'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(
                        Icons.invert_colors_sharp, 'Med.Continuada'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: myBottonBar(),
    );
  }

  Widget minhaEstruturaCard(IconData icon, String title) {
    return SizedBox(
      height: 70,
      width: 200,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  icon,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => irParaOpcao(title),
                      child: Text(
                        "Visualizar",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(100, 20),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  irParaOpcao(String opcao) {
    switch (opcao) {
      case 'Vacinas':
        Get.to(() => VacinaView());
        break;
      case 'Alergias':
        Get.to(() => AlergiasView());
        break;
      default:
    }
  }

  Widget myBottonBar() {
    return BottomAppBar(
      child: SizedBox(
        //width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 32,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
              ),
            ),
            SizedBox(
              width: 32,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
