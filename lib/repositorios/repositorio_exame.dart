import 'package:get/get.dart';
import 'package:higia/constants/constants.dart';
import 'package:higia/controllers/exame_controllers.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/models/exame_model.dart';
import 'package:higia/models/usuarioModel.dart';
import 'package:higia/models/usuario_exame_model.dart';
import 'package:higia/models/usuario_vacina_cad_model.dart';
import 'package:higia/models/usuario_vacina_model.dart';
import 'package:higia/models/vacina_model.dart';

final exameController = Get.put(ExameController());

class RepositorioExames {
  final connect = myConfigHasuraConnect();

  Future<List<ExameModel>> buscarListaTodosExames() async {
    String myQuery = """
            query MyQuery {
              exames {
                id
                nome
                descricao
                para_sexo
                created_at
              }
            }
            """;

    // print('QUERY ENVIADA CONSULTAR EXAME: \n $myQuery');

    var retornoConsultaExames = await myConfigHasuraConnect().query(myQuery);

    if (retornoConsultaExames['data']['exames'].toString() == '[]') {
      return [];
    } else {
      List<ExameModel> lista = [];
      retornoConsultaExames['data']['exames'].forEach((vacina) {
        lista.add(ExameModel.fromJson(vacina));
      });
      return lista;
    }
  }

  Future<bool> cadastrarExameUsuario(
      UsuarioExameModel usuarioExameModel) async {
    String myMutation = """                   
            mutation MyMutation {
              insert_exame_usuario(
                objects: {
                  id_exame: "${usuarioExameModel.idExame}", 
                  id_usuario: "${usuarioExameModel.idUsuario}", 
                  url_foto_exame: "${usuarioExameModel.urlFotoExame}", 
                  data_exame: "${usuarioExameModel.dataExame}", 
                }) {
                affected_rows
              }
            }

            """;

    //   print('CADASTRAR VACINA_USUARIO: $myMutation');
    var returnCadastroVacina = await connect.mutation(myMutation);

    if (returnCadastroVacina['data']['insert_exame_usuario']
            ['affected_rows'] ==
        0) {
      return false;
    } else {
      return true;
    }
  }

  iniSubscriptionCarregarListaExamesPorUsuario(String? idUsuario) async {
    String mySubscription = """
            subscription MyQuery {
              exame_usuario(
                where: {
                  id_usuario: {_eq: "$idUsuario"}}) {
                id
                id_exame
                id_usuario
                url_foto_exame
                data_exame
                exame {
                  id
                  nome
                  para_sexo
                  descricao
                  created_at
                }
              }
            }
            """;

    // print('ENVIANDO mySubscription: $mySubscription');
    // connect.dispose();

    var returnSubscriptionExame = await connect.subscription(mySubscription);

    returnSubscriptionExame.listen((exame) {
      //   print('DENTRO DO returnSubscriptionVacina: $vacina');
      List<UsuarioExameModel>? usuarioExamesList = [];

      exame['data']['exame_usuario'].forEach((exam) {
        usuarioExamesList.add(UsuarioExameModel.fromJson(exam));
      });

      exameController.carregarListaExamesPorUsuario(usuarioExamesList);
    }).onError((err) {
      print(err);
    });
  }

  Future<bool> atualizarExameUsuario(
      UsuarioVacinaCadModel usuarioVacinaCadModel) async {
    String myMutation = """
            mutation MyMutation {
              update_usuario_vacina(
                where: {id: {_eq: "${usuarioVacinaCadModel.id}"}}, 
                _set: {
                  id_vacina: ${usuarioVacinaCadModel.idVacina}, 
                  data_vacinacao: "${usuarioVacinaCadModel.dataVacinacao}",
                  url_foto_vacina: "${usuarioVacinaCadModel.urlFotoVacina}"
                }) {
                affected_rows
              }
            }
            """;

    // print('CADASTRAR VACINA_USUARIO: $myMutation');
    var returnAtualizacaoVacina = await connect.mutation(myMutation);

    if (returnAtualizacaoVacina['data']['update_usuario_vacina']
            ['affected_rows'] ==
        0) {
      return false;
    } else {
      return true;
    }
  }
}
