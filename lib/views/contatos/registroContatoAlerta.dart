import 'package:flutter/material.dart';
import 'package:get/get.dart';

double alturaTela = 0;
double larguraTela = 0;

registroContatoAlerta(BuildContext context) {
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
        content: Container(
          height: alturaTela * 0.60,
          width: larguraTela * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  //color: Color.fromRGBO(36, 38, 38, 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                width: double.infinity,
                height: alturaTela * 0.07,
                child: Center(
                    /* child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: larguraTela * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  */
                    ),
              ),
              /* SizedBox(
                height: _heightScreenSize * 0.02,
              ),
              */

              options(),
            ],
          ),
        ),
      );
    },
  );
}

options() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
    ),
    height: alturaTela * 0.5,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bloodtype_outlined,
                  color: Colors.indigo[400],
                  size: alturaTela * 0.15,
                ),
              ],
            ),

            // SizedBox(height: alturaTela * 0.005,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cadastrar Alergias",
                  style: TextStyle(
                    fontSize: alturaTela * 0.03,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo[200],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: alturaTela * 0.05,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: larguraTela * 0.7,
                  height: alturaTela * 0.05,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                      //  Get.to(() => RegisterUserView());
                    },
                    label: Text(
                      'Nome da Alergia',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    icon: Icon(
                      Icons.shortcut_outlined,
                      color: Colors.black,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: alturaTela * 0.03,
            ),

            SizedBox(
              height: alturaTela * 0.03,
            ),

            Padding(
              padding: EdgeInsets.only(left: larguraTela * 0.08),
              child: Row(
                children: [
                  SizedBox(
                      width: larguraTela * 0.33,
                      height: alturaTela * 0.04,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: alturaTela * 0.04,
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
          ],
        ),
      ],
    ),
  );
}
