import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:higia/controllers/exame_controllers.dart';

Widget iconeVerExames(double larguraTela) {
  return GetBuilder<ExameController>(builder: (controller) {
    return controller.urlImagemFotoVacina == 'no'
        ? SizedBox()
        : IconButton(
            onPressed: () => controller.verFotoVacina(),
            icon: FaIcon(
              FontAwesomeIcons.eye,
              color: Colors.blue,
              size: larguraTela * 0.05,
            ),
          );
  });
}
