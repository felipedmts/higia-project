import 'package:flutter/material.dart';
import 'package:get/get.dart';

double alturaTela = 0;
double larguraTela = 0;

registroVacinaAlerta(BuildContext context) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    //barrierColor: Color(0xFFF5F5F5),
    barrierColor: Color.fromRGBO(211, 211, 211, 0.4),

    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        //    insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        content: options(),
      );
    },
  );
}

options() {
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
          size: alturaTela * 0.15,
        ),
        SizedBox(
          height: alturaTela * 0.005,
        ),
        Text(
          "Cadastrar Vacina",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent[700]),
        ),
        SizedBox(
          height: alturaTela * 0.09,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: Expanded(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Nome da vacina",
                labelStyle:
                    TextStyle(fontSize: 14, color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: alturaTela * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: Expanded(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Data da vacina",
                labelStyle:
                    TextStyle(fontSize: 14, color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
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
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                    size: alturaTela * 0.04,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Cadastrar Vacina', // Falta adicionar o icone

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
      ],
    ),
  );
}
