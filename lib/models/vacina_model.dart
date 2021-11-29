// To parse this JSON data, do
//
//     final vacinaModel = vacinaModelFromJson(jsonString);

import 'dart:convert';

VacinaModel vacinaModelFromJson(String str) =>
    VacinaModel.fromJson(json.decode(str));

String vacinaModelToJson(VacinaModel data) => json.encode(data.toJson());

class VacinaModel {
  VacinaModel({
    this.id,
    this.nome,
    this.descricaoServentia,
    this.faixaEtaria,
    this.createdAt,
  });

  int? id;
  String? nome;
  String? descricaoServentia;
  String? faixaEtaria;
  DateTime? createdAt;

  factory VacinaModel.fromJson(Map<String, dynamic> json) => VacinaModel(
        id: json["id"],
        nome: json["nome"],
        descricaoServentia: json["descricao_serventia"],
        faixaEtaria: json["faixa_etaria"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao_serventia": descricaoServentia,
        "faixa_etaria": faixaEtaria,
        "created_at": createdAt!.toIso8601String(),
      };
}
