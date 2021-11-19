// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.idUuid,
    this.idIncremental,
    this.nome,
    this.email,
    this.cpf,
    this.senha,
    this.atualizadoEm,
    this.criadoEm,
  });

  String? idUuid;
  int? idIncremental;
  String? nome;
  String? email;
  String? cpf;
  String? senha;
  DateTime? atualizadoEm;
  DateTime? criadoEm;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        idUuid: json["id_UUID"],
        idIncremental: json["id_incremental"],
        nome: json["nome"],
        email: json["email"],
        cpf: json["cpf"],
        senha: json["senha"],
        atualizadoEm: DateTime.parse(json["atualizado_em"]),
        criadoEm: DateTime.parse(json["criado_em"]),
      );

  Map<String, dynamic> toJson() => {
        "id_UUID": idUuid,
        "id_incremental": idIncremental,
        "nome": nome,
        "email": email,
        "cpf": cpf,
        "senha": senha,
        "atualizado_em": atualizadoEm!.toIso8601String(),
        "criado_em": criadoEm!.toIso8601String(),
      };
}
