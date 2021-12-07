// To parse this JSON data, do
//
//     final usuarioExameModel = usuarioExameModelFromJson(jsonString);

import 'dart:convert';

UsuarioExameModel usuarioExameModelFromJson(String str) =>
    UsuarioExameModel.fromJson(json.decode(str));

String usuarioExameModelToJson(UsuarioExameModel data) =>
    json.encode(data.toJson());

class UsuarioExameModel {
  UsuarioExameModel({
    this.id,
    this.idExame,
    this.idUsuario,
    this.urlFotoExame,
    this.dataExame,
    this.exame,
  });

  String? id;
  String? idExame;
  String? idUsuario;
  String? urlFotoExame;
  DateTime? dataExame;
  Exame? exame;

  factory UsuarioExameModel.fromJson(Map<String, dynamic> json) =>
      UsuarioExameModel(
        id: json["id"],
        idExame: json["id_exame"],
        idUsuario: json["id_usuario"],
        urlFotoExame: json["url_foto_exame"],
        dataExame: DateTime.parse(json["data_exame"]),
        exame: Exame.fromJson(json["exame"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_exame": idExame,
        "id_usuario": idUsuario,
        "url_foto_exame": urlFotoExame,
        "data_exame": dataExame!.toIso8601String(),
        "exame": exame!.toJson(),
      };
}

class Exame {
  Exame({
    this.id,
    this.nome,
    this.paraSexo,
    this.descricao,
    this.createdAt,
  });

  String? id;
  String? nome;
  String? paraSexo;
  String? descricao;
  DateTime? createdAt;

  factory Exame.fromJson(Map<String, dynamic> json) => Exame(
        id: json["id"],
        nome: json["nome"],
        paraSexo: json["para_sexo"],
        descricao: json["descricao"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "para_sexo": paraSexo,
        "descricao": descricao,
        "created_at": createdAt!.toIso8601String(),
      };
}
