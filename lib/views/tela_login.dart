import 'package:flutter/material.dart';
import 'dart:ui';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        //color: Colors.blueAccent[100],
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.centerRight,
            begin: Alignment.topRight,
            colors: [
              //Color(0xff38eeff),
              //Color(0xff38eeff),
              Color(0xffACD2ff),
              Color(0x00246eb9),
              Color(0x00246eb9),
            ],
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.facebook_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.g_mobiledata_sharp),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 14),
                child: Text(
                  "Bem-Vindo de Volta!",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                //color: Colors.redAccent,
                width: 400,
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "    Email",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          //color: Colors.red,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 40,
              height: 20,
            ),
            Container(
              //color: Colors.redAccent,
              width: 400,
              height: 60,

              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "    Senha",
                  labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        //color: Colors.red,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Entrar",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Criar Cadastro",
                style: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              "Não tem conta? crie uma agora mesmo",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
