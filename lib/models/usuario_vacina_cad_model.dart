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
    this.urlFotoVacina,
    this.idVacina,
    this.dataVacinacao,
  });

  String? id;
  String? idUsuario;
  String? urlFotoVacina;
  int? idVacina;
  DateTime? dataVacinacao;

  factory UsuarioVacinaCadModel.fromJson(Map<String, dynamic> json) =>
      UsuarioVacinaCadModel(
        id: json["id"],
        idUsuario: json["id_usuario"],
        urlFotoVacina: json["url_foto_vacina"],
        idVacina: json["id_vacina"],
        dataVacinacao: DateTime.parse(json["data_vacinacao"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usuario": idUsuario,
        "url_foto_vacina": urlFotoVacina,
        "id_vacina": idVacina,
        "data_vacinacao": dataVacinacao!.toIso8601String(),
      };
}
