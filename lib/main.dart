import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/views/inicial_view.dart';

import 'views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    title: 'OLA',
    home: InicialView(),
    debugShowCheckedModeBanner: false,
  ));
}
