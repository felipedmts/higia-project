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
    this.senha,
    this.cpf,
    this.email,
    this.criadoEm,
    this.atualizadoEm,
    this.urlImagemPerfil,
    this.usuarioVacinas,
  });

  String? idUuid;
  int? idIncremental;
  String? nome;
  String? senha;
  String? cpf;
  String? email;
  DateTime? criadoEm;
  DateTime? atualizadoEm;
  String? urlImagemPerfil;
  List<UsuarioVacina>? usuarioVacinas;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    //ajuste para não der erro quando a a lista de vacinas do usuário vier vazi/nula
    List<UsuarioVacina> ajustList = json["usuario_vacinas"] == null
        ? []
        : List<UsuarioVacina>.from(
            json["usuario_vacinas"].map((x) => UsuarioVacina.fromJson(x)));
    return UsuarioModel(
      idUuid: json["id_UUID"],
      idIncremental: json["id_incremental"],
      nome: json["nome"],
      senha: json["senha"],
      cpf: json["cpf"],
      email: json["email"],
      criadoEm: DateTime.parse(json["criado_em"]),
      atualizadoEm: DateTime.parse(json["atualizado_em"]),
      urlImagemPerfil: json["url_imagem_perfil"],
      usuarioVacinas: ajustList,
    );
  }

  Map<String, dynamic> toJson() => {
        "id_UUID": idUuid,
        "id_incremental": idIncremental,
        "nome": nome,
        "senha": senha,
        "cpf": cpf,
        "email": email,
        "criado_em": criadoEm!.toIso8601String(),
        "atualizado_em": atualizadoEm!.toIso8601String(),
        "url_imagem_perfil": urlImagemPerfil,
        "usuario_vacinas":
            List<dynamic>.from(usuarioVacinas!.map((x) => x.toJson())),
      };
}

class UsuarioVacina {
  UsuarioVacina({
    this.id,
    this.idUsuario,
    this.dataVacinacao,
    this.vacina,
  });

  String? id;
  String? idUsuario;
  DateTime? dataVacinacao;
  Vacina? vacina;

  factory UsuarioVacina.fromJson(Map<String, dynamic> json) => UsuarioVacina(
        id: json["id"],
        idUsuario: json["id_usuario"],
        dataVacinacao: DateTime.parse(json["data_vacinacao"]),
        vacina: Vacina.fromJson(json["vacina"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usuario": idUsuario,
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
