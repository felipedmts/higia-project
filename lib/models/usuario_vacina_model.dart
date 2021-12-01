// To parse this JSON data, do
//
//     final usuarioVacinaModel = usuarioVacinaModelFromJson(jsonString);

import 'dart:convert';

UsuarioVacinaModel usuarioVacinaModelFromJson(String str) =>
    UsuarioVacinaModel.fromJson(json.decode(str));

String usuarioVacinaModelToJson(UsuarioVacinaModel data) =>
    json.encode(data.toJson());

class UsuarioVacinaModel {
  UsuarioVacinaModel({
    this.id,
    this.idUsuario,
    this.urlFotoVacina,
    this.idVacina,
    this.dataVacinacao,
    this.vacina,
  });

  String? id;
  String? idUsuario;
  String? urlFotoVacina;
  int? idVacina;
  DateTime? dataVacinacao;
  Vacina? vacina;

  factory UsuarioVacinaModel.fromJson(Map<String, dynamic> json) =>
      UsuarioVacinaModel(
        id: json["id"],
        idUsuario: json["id_usuario"],
        urlFotoVacina: json["url_foto_vacina"],
        idVacina: json["id_vacina"],
        dataVacinacao: DateTime.parse(json["data_vacinacao"]),
        vacina: Vacina.fromJson(json["vacina"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usuario": idUsuario,
        "url_foto_vacina": urlFotoVacina,
        "id_vacina": idVacina,
        "data_vacinacao": dataVacinacao!.toIso8601String(),
        "vacina": vacina!.toJson(),
      };
}

class Vacina {
  Vacina({
    this.id,
    this.nome,
    this.faixaEtaria,
    this.descricaoServentia,
    this.createdAt,
  });

  int? id;
  String? nome;
  String? faixaEtaria;
  String? descricaoServentia;
  DateTime? createdAt;

  factory Vacina.fromJson(Map<String, dynamic> json) => Vacina(
        id: json["id"],
        nome: json["nome"],
        faixaEtaria: json["faixa_etaria"],
        descricaoServentia: json["descricao_serventia"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "faixa_etaria": faixaEtaria,
        "descricao_serventia": descricaoServentia,
        "created_at": createdAt!.toIso8601String(),
      };
}
