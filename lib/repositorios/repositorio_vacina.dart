import 'package:get/get.dart';
import 'package:higia/constants/constants.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/models/usuarioModel.dart';
import 'package:higia/models/usuario_vacina_cad_model.dart';
import 'package:higia/models/usuario_vacina_model.dart';
import 'package:higia/models/vacina_model.dart';

final vacinaController = Get.put(VacinaController());

class RepositorioVacina {
  final connect = myConfigHasuraConnect();

  Future<List<VacinaModel>> buscarListaTodasVacinas() async {
    String myQuery = """
            query MyQuery {
              vacinas {
                id
                nome
                descricao_serventia
                faixa_etaria
                created_at
              }
            }
            """;

    // print('QUERY ENVIADA CONSULTAR USUÁRIOS: \n $myQuery');

    var retornoConsultaVacina = await myConfigHasuraConnect().query(myQuery);

    if (retornoConsultaVacina['data']['vacinas'].toString() == '[]') {
      return [];
    } else {
      List<VacinaModel> lista = [];
      retornoConsultaVacina['data']['vacinas'].forEach((vacina) {
        lista.add(VacinaModel.fromJson(vacina));
      });
      return lista;
    }
  }

  Future<bool> cadastrarVacinaUsuario(
      UsuarioVacinaCadModel usuarioVacinaCadModel) async {
    String myMutation = """
            mutation MyMutation {
              insert_usuario_vacina(
                objects: {
                  id_usuario: "${usuarioVacinaCadModel.idUsuario}", 
                  id_vacina: ${usuarioVacinaCadModel.idVacina}, 
                  data_vacinacao: "${usuarioVacinaCadModel.dataVacinacao}"
                }) {
                affected_rows
              }
            }
            """;

    //   print('CADASTRAR VACINA_USUARIO: $myMutation');
    var returnRegisterNewExpense = await connect.mutation(myMutation);

    if (returnRegisterNewExpense['data']['insert_usuario_vacina']
            ['affected_rows'] ==
        0) {
      return false;
    } else {
      return true;
    }
  }

  iniSubscriptionCarregarListaVacinasPorUsuario(String? idUsuario) async {
    String mySubscription = """
            subscription MySubscription {
              usuario_vacina(
                where: {
                  id_usuario: {
                    _eq: "$idUsuario"
                  }}) {
                id
                id_usuario
                id_vacina
                data_vacinacao
                vacina {
                  id
                  nome
                  faixa_etaria
                  descricao_serventia
                  created_at
                }
              }
            }
            """;

    // print('ENVIANDO mySubscription: $mySubscription');
    // connect.dispose();

    var returnSubscriptionVacina = await connect.subscription(mySubscription);

    returnSubscriptionVacina.listen((vacina) {
      //   print('DENTRO DO returnSubscriptionVacina: $vacina');
      List<UsuarioVacinaModel>? usuarioVacinaList = [];

      vacina['data']['usuario_vacina'].forEach((vac) {
        usuarioVacinaList.add(UsuarioVacinaModel.fromJson(vac));
      });

      vacinaController.carregarListaVacinasPorUsuario(usuarioVacinaList);
    }).onError((err) {
      print(err);
    });
  }

  Future<bool> atualizarVacinaUsuario(
      UsuarioVacinaCadModel usuarioVacinaCadModel) async {
    String myMutation = """
            mutation MyMutation {
              insert_usuario_vacina(
                objects: {
                  id_usuario: "${usuarioVacinaCadModel.idUsuario}", 
                  id_vacina: ${usuarioVacinaCadModel.idVacina}, 
                  data_vacinacao: "${usuarioVacinaCadModel.dataVacinacao}"
                }) {
                affected_rows
              }
            }
            """;

    // print('CADASTRAR VACINA_USUARIO: $myMutation');
    var returnRegisterNewExpense = await connect.mutation(myMutation);

    if (returnRegisterNewExpense['data']['insert_usuario_vacina']
            ['affected_rows'] ==
        0) {
      return false;
    } else {
      return true;
    }
  }
}
