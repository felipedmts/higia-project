// To parse this JSON data, do
//
//     final exameModel = exameModelFromJson(jsonString);

import 'dart:convert';

ExameModel exameModelFromJson(String str) =>
    ExameModel.fromJson(json.decode(str));

String exameModelToJson(ExameModel data) => json.encode(data.toJson());

class ExameModel {
  ExameModel({
    this.id,
    this.nome,
    this.descricao,
    this.paraSexo,
    this.createdAt,
  });

  String? id;
  String? nome;
  String? descricao;
  String? paraSexo;
  DateTime? createdAt;

  factory ExameModel.fromJson(Map<String, dynamic> json) => ExameModel(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"],
        paraSexo: json["para_sexo"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "para_sexo": paraSexo,
        "created_at": createdAt!.toIso8601String(),
      };
}
