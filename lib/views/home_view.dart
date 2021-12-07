import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_camera.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/generalUse/my_count%20age.dart';
import 'package:higia/views/alergias/alergias_view.dart';
import 'package:higia/views/alergias/resistroAlergiaAlerta.dart';
import 'package:higia/views/componentes_uso_geral/info_perfil.dart';
import 'package:higia/views/exame/exame_view.dart';
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
          padding: EdgeInsets.only(top: alturaTela * 0.03),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                inforPerfil(context),
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
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fvacina%201.png?alt=media&token=ef9542d9-055d-489a-9395-5767542352c6',
                        'Vacinas'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fexames.png?alt=media&token=5cf79797-68c8-4a96-9053-1b3d67f71c06',
                        'Exames'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Falergia.png?alt=media&token=fd398316-2dbb-4037-90ac-0c77b2f66cbf',
                        'Alergias'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fdoencas.png?alt=media&token=5b20d968-da60-4de5-b357-c8d0c3471cb7',
                        'Doenças'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fcontatos.png?alt=media&token=90a8b10b-84da-40f8-860b-2d21c84dcaea',
                        'Contatos'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fhist_familiar.png?alt=media&token=af221bd1-4960-49e1-9eff-68942b4054f9',
                        'Hist. Família'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fgenetica.png?alt=media&token=08f5a064-405c-4260-853c-eb6c60b8d576',
                        'Genética'),
                    SizedBox(
                      width: 10,
                    ),
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fqr_code.png?alt=media&token=78964ed6-14dd-426b-badb-4ddd9da90879',
                        'Hist. QR. Code'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minhaEstruturaCard(
                        'https://firebasestorage.googleapis.com/v0/b/higia-24149.appspot.com/o/icones_categorias_pagina_inicial%2Fmed_continuada.png?alt=media&token=9e03467e-92c4-48e6-aa58-4018b5654fda',
                        'Med.Continuada'),
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

  Widget minhaEstruturaCard(String url, String title) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.network(url),
                backgroundColor: Colors.transparent,
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
      case 'Exames':
        Get.to(() => ExamesView());
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
