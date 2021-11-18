import 'package:flutter/material.dart';

class TelaInicialPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white10,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 400,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 100),
                    ),
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ariel Lopes",
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
                        'images/logo.png',
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
                child: Icon(icon),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Row(
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Visualizar",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
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
