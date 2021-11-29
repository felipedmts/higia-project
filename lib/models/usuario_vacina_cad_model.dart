// To parse this JSON data, do
//
//     final usuarioVacinaCadModel = usuarioVacinaCadModelFromJson(jsonString);

import 'dart:convert';

UsuarioVacinaCadModel usuarioVacinaCadModelFromJson(String str) =>
    UsuarioVacinaCadModel.fromJson(json.decode(str));

String usuarioVacinaCadModelToJson(UsuarioVacinaCadModel data) =>
    json.encode(data.toJson());

class UsuarioVacinaCadModel {
  UsuarioVacinaCadModel({
    this.id,
    this.idUsuario,
    this.idVacina,
    this.dataVacinacao,
  });

  String? id;
  String? idUsuario;
  int? idVacina;
  DateTime? dataVacinacao;

  factory UsuarioVacinaCadModel.fromJson(Map<String, dynamic> json) =>
      UsuarioVacinaCadModel(
        id: json["id"],
        idUsuario: json["id_usuario"],
        idVacina: json["id_vacina"],
        dataVacinacao: DateTime.parse(json["data_vacinacao"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usuario": idUsuario,
        "id_vacina": idVacina,
        "data_vacinacao": dataVacinacao!.toIso8601String(),
      };
}
