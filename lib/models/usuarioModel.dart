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
    this.urlImagemPerfil,
    this.dataNascimento,
    this.atualizadoEm,
    this.criadoEm,
    this.sexo,
    this.tiposSanguineo,
  });

  String? idUuid;
  int? idIncremental;
  String? nome;
  String? email;
  String? cpf;
  String? senha;
  String? urlImagemPerfil;

  DateTime? dataNascimento;
  DateTime? atualizadoEm;
  DateTime? criadoEm;
  Sexo? sexo;
  TiposSanguineo? tiposSanguineo;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        idUuid: json["id_UUID"],
        idIncremental: json["id_incremental"],
        nome: json["nome"],
        email: json["email"],
        cpf: json["cpf"],
        senha: json["senha"],
        urlImagemPerfil: json["url_imagem_perfil"],
        dataNascimento: DateTime.parse(json["data_nascimento"]),
        atualizadoEm: DateTime.parse(json["atualizado_em"]),
        criadoEm: DateTime.parse(json["criado_em"]),
        sexo: Sexo.fromJson(json["sexo"]),
        tiposSanguineo: TiposSanguineo.fromJson(json["tipos_sanguineo"]),
      );

  Map<String, dynamic> toJson() => {
        "id_UUID": idUuid,
        "id_incremental": idIncremental,
        "nome": nome,
        "email": email,
        "cpf": cpf,
        "senha": senha,
        "url_imagem_perfil": urlImagemPerfil,
        "data_nascimento": dataNascimento!.toIso8601String(),
        "atualizado_em": atualizadoEm!.toIso8601String(),
        "criado_em": criadoEm!.toIso8601String(),
        "sexo": sexo!.toJson(),
        "tipos_sanguineo": tiposSanguineo!.toJson(),
      };
}

class Sexo {
  Sexo({
    this.id,
    this.nome,
    this.descricao,
  });

  int? id;
  String? nome;
  String? descricao;

  factory Sexo.fromJson(Map<String, dynamic> json) => Sexo(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
      };
}

class TiposSanguineo {
  TiposSanguineo({
    this.id,
    this.tipo,
    this.recebeDe,
    this.doaPara,
    this.urlImageType,
  });

  int? id;
  String? tipo;
  String? recebeDe;
  String? doaPara;
  String? urlImageType;

  factory TiposSanguineo.fromJson(Map<String, dynamic> json) => TiposSanguineo(
        id: json["id"],
        tipo: json["tipo"],
        recebeDe: json["recebe_de"],
        doaPara: json["doa_para"],
        urlImageType: json["url_image_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "recebe_de": recebeDe,
        "doa_para": doaPara,
        "url_image_type": urlImageType,
      };
}
