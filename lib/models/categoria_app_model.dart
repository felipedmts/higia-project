// To parse this JSON data, do
//
//     final categoriaAppModel = categoriaAppModelFromJson(jsonString);

import 'dart:convert';

CategoriaAppModel categoriaAppModelFromJson(String str) =>
    CategoriaAppModel.fromJson(json.decode(str));

String categoriaAppModelToJson(CategoriaAppModel data) =>
    json.encode(data.toJson());

class CategoriaAppModel {
  CategoriaAppModel({
    this.id,
    this.nome,
    this.urlIcone,
    this.createdAt,
  });

  int? id;
  String? nome;
  String? urlIcone;
  DateTime? createdAt;

  factory CategoriaAppModel.fromJson(Map<String, dynamic> json) =>
      CategoriaAppModel(
        id: json["id"],
        nome: json["nome"],
        urlIcone: json["url_icone"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "url_icone": urlIcone,
        "created_at": createdAt!.toIso8601String(),
      };
}
