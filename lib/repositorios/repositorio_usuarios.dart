import 'package:higia/constants/constants.dart';
import 'package:higia/models/usuarioModel.dart';

class RepositorioUsuario {
  final connect = myConfigHasuraConnect();

  Future<UsuarioModel> validarUsuario(UsuarioModel usuario) async {
    String myQuery = """
                        query MyQuery {
              usuarios(
                where: {
                  email: {_eq: "${usuario.email}"}, 
                  senha: {_eq: "${usuario.senha}"}}) 
              {
                id_UUID
                id_incremental
                nome
                email
                cpf
                url_imagem_perfil
                data_nascimento
                atualizado_em
                criado_em
                sexo {
                      id
                      nome
                      descricao
                }
                tipos_sanguineo {
                      id
                      tipo
                      recebe_de
                      doa_para
                      url_image_type
                }
              }
            }
            """;

    // print('QUERY ENVIADA CONSULTAR USUÁRIOS: \n $myQuery');

    var retornoValidarUsuario = await myConfigHasuraConnect().query(myQuery);

    if (retornoValidarUsuario['data']['usuarios'].toString() == '[]') {
      return UsuarioModel(idUuid: 'no');
    } else {
      return UsuarioModel.fromJson(
          retornoValidarUsuario['data']['usuarios'][0]);
    }
  }

  Future<bool> registrarUsuario(UsuarioModel usuario) async {
    String myMutation = """
            mutation MyMutation {
              insert_usuarios(
                objects: {
                  nome: "${usuario.nome}", 
                  email: "${usuario.email}", 
                  cpf: "${usuario.cpf}", 
                  senha:"${usuario.senha}", 
                }) {
                affected_rows
              }
            }
            """;

    print('QUERY ENVIADA PARA REGISTRAR USUARIO: \n $myMutation');

    var retornoRegistrarUsuario =
        await myConfigHasuraConnect().mutation(myMutation);

    if (retornoRegistrarUsuario['data']['affected_rows'] == 0) {
      print(
          'RETORNO DO REGISTRAR USUARIO FALSE \n ${retornoRegistrarUsuario['data']}');
      return false;
    } else {
      print(
          'RETORNO DO REGISTRAR USUARIO TRUE \n ${retornoRegistrarUsuario['data']}');

      return true;
    }
  }

  Future<bool> checkIfLoginAlreadyExists(String login) async {
    String myQuery = """
            query MyQuery {
              private_usersPrecoBom(
                where: {
                  login: {_eq: "$login"}}) {
                login
              }
            }
            """;

    print('QUERY ENVIADA CONSULTAR USUÁRIOS: \n $myQuery');

    var returnUserSearch = await myConfigHasuraConnect().query(myQuery);
    print(
        'RETORNO DA CONSULTA USUÁRIO returnUserSearch\n ${returnUserSearch['data']['private_usersPrecoBom']}');
    if (returnUserSearch['data']['private_usersPrecoBom'].toString() == '[]') {
      print(
          'RETORNO DA CONSULTA USUÁRIO FALSO \n ${returnUserSearch['data']['private_usersPrecoBom']}');
      return false;
    } else {
      print(
          'RETORNO DA CONSULTA USUÁRIO VERDADEIRO \n ${returnUserSearch['data']['private_usersPrecoBom']}');
      return true;
    }
  }
}
