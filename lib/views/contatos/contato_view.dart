import 'package:flutter/material.dart';
import 'package:higia/views/contatos/registroContatoAlerta.dart';

class ContatoView extends StatelessWidget {
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
        //color: Colors.red,
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
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: larguraTela * 0.02,
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
                height: alturaTela * 0.04,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(30),
                  color: Colors.blue[800],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONTATOS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: alturaTela * 0.055,
              ),
              Padding(
                padding: EdgeInsets.only(left: larguraTela * 0.05),
                child: Row(
                  children: [
                    SizedBox(
                      width: larguraTela * 0.30,
                      height: alturaTela * 0.035,
                      child: TextButton.icon(
                        onPressed: () => registroContatoAlerta(context),
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Adicionar contatos', // Falta adicionar o icone

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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: alturaTela * 0.035,
              ),
              SizedBox(
                height: alturaTela * 0.29,
                width: larguraTela * 1,

                //height: 500,
                // width: 600,
                child: Column(
                  children: List.generate(
                    1,
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
    return Padding(
      //padding: const EdgeInsets.all(12.0),
      padding:
          EdgeInsets.only(left: larguraTela * 0.05, right: larguraTela * 0.02),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: alturaTela * 0.15,
            width: larguraTela * 0.96,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 25, top: 5)),
                    CircleAvatar(
                      child: Icon(
                        Icons.contact_mail_rounded,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: larguraTela * 0.02,
                    ),
                    Text(
                      "Nome da Pessoa",
                      style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: larguraTela * 0.01,
                    ),
                    Padding(
                      //padding: const EdgeInsets.all(5.0),
                      padding: EdgeInsets.only(
                          left: larguraTela * 0.02, right: larguraTela * 0.02),
                      child: Text(
                        "ID",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    SizedBox(
                      width: larguraTela * 0.08,
                      height: alturaTela * 0.02,
                      child: Container(
                        //width: larguraTela * 0.05,
                        // height:  alturaTela * 0.02,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              // width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        //color: Colors.amberAccent,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      //padding: EdgeInsets.only(right: larguraTela * 0.05),
                      padding: EdgeInsets.only(
                          left: larguraTela * 0.15, right: larguraTela * 0.02),

                      child: Text(
                        "Tel: 77 98100-0000",
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: larguraTela * 0.01),
                      child: Text(
                        "Cep:",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "00000-000",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
