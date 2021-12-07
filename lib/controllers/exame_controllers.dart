import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/generalUse/my_formate_date.dart';
import 'package:higia/models/exame_model.dart';
import 'package:higia/models/usuario_exame_model.dart';
import 'package:higia/models/usuario_vacina_cad_model.dart';
import 'package:higia/models/usuario_vacina_model.dart';
import 'package:higia/models/vacina_model.dart';
import 'package:higia/repositorios/repositorio_exame.dart';
import 'package:higia/repositorios/repositorio_vacina.dart';
import 'package:higia/views/componentes_uso_geral/mySnackBar.dart';
import 'package:higia/views/exame/registrar_editar_exame_alerta.dart';
import 'package:higia/views/vacina/registrar_editar_vacina_alerta.dart';
import 'package:url_launcher/url_launcher.dart';

final controllerUsuario = Get.put(ControllerUsuario());

class ExameController extends GetxController {
  List<ExameModel> listaTodosExames = [];
  TextEditingController dataController =
      TextEditingController(text: myFormateDateNoHour(DateTime.now()));

  void buscarListaTodosExames(String registrarEditar) async {
    //
    listaTodosExames = await RepositorioExames().buscarListaTodosExames();

//DropDown da erro se não carregar ele com objeto da mesma lista que o compõe.
//não funcionou mesmo criando novo objeto do mesmo tipo...
    ExameModel? vacinaASerCarregadaNoDropDown = registrarEditar == 'editar'
        ? listaTodosExames
            .firstWhere((vacina) => vacina.id == idExameSelecionadaEdicao)
        : listaTodosExames[0];
    setarExameSelecionadaNoDropDown(vacinaASerCarregadaNoDropDown);
  }

  ExameModel? exameSelecionadaNoDropDown;
  void setarExameSelecionadaNoDropDown(ExameModel? newValue) {
    exameSelecionadaNoDropDown = newValue;
    print(
        'VERIFICAR DADOS DA VACINA SELECIONADA vacinaSelecionadaNoDropDown => ${exameSelecionadaNoDropDown!.toJson()}');
    update();
  }

  DateTime? dataSelecionadaSemFormatar = DateTime.now();
  void setarDataselecionada(DateTime? dataParametro) {
    dataSelecionadaSemFormatar = dataParametro;
    dataController.text = myFormateDateNoHour(dataParametro);
    update();
  }

  bool estaCadastrandoExame = false;

  void cadastrarExameUsuario() async {
    estaCadastrandoExame = true;
    update();
    UsuarioExameModel usuarioVacina = UsuarioExameModel(
      idUsuario: controllerUsuario.usuarioLogado.idUuid,
      idExame: exameSelecionadaNoDropDown!.id,
      dataExame: dataSelecionadaSemFormatar,
      urlFotoExame: urlImagemFotoVacina,
    );
    bool foiCadastrada =
        await RepositorioExames().cadastrarExameUsuario(usuarioVacina);

    estaCadastrandoExame = false;
    update();

    if (foiCadastrada) {
      Get.back();
      mySnackBar(
        'Muito be!',
        'Vacina cadastrada!',
        Icons.check,
        Colors.green,
      );
    } else {
      mySnackBar(
        'Ops!',
        'Erro ao registrar Vacina!!',
        Icons.error,
        Colors.red,
      );
    }
  }

  initSubscriptionCarregarListaExamesPorUsuario() {
    RepositorioExames().iniSubscriptionCarregarListaExamesPorUsuario(
        controllerUsuario.usuarioLogado.idUuid);
  }

//CARREGANDO VACINAS DO USUÁRIO
  List<UsuarioExameModel>? listaExamesPorUsuario = [];
  void carregarListaExamesPorUsuario(
      List<UsuarioExameModel>? usuarioExamesList) {
    listaExamesPorUsuario = usuarioExamesList;
    //  print(        'TAMANHO DA listaVacinasPorUsuario: ${listaVacinasPorUsuario!.length}');
    update();
  }

//PROCESSOD DE EDITAR
  bool iniciouEdicao = false;
  String? idExameSelecionadaEdicao;
  String? idRelacaoUsuarioExame;
  setarExameSelecionadaParaEdicao(
      UsuarioExameModel vacinaParam, BuildContext context) {
    iniciouEdicao = true;
    idExameSelecionadaEdicao = vacinaParam.exame!.id;
    idRelacaoUsuarioExame = vacinaParam.id;
    dataController.text = myFormateDateNoHour(vacinaParam.dataExame);
    dataSelecionadaSemFormatar = vacinaParam.dataExame;
    urlImagemFotoVacina = vacinaParam.urlFotoExame!;

    if (listaTodosExames.isEmpty) {
      buscarListaTodosExames('editar');
    } else {
      exameSelecionadaNoDropDown = listaTodosExames
          .firstWhere((vacina) => vacina.id == vacinaParam.exame!.id);
    }

    registrarEditarExameAlerta(context);
  }

  bool estaAtualizandoExame = false;

  /*
  void atualizarVacinaUsuario() async {
    estaAtualizandoVacina = true;
    update();
    UsuarioVacinaCadModel usuarioVacina = UsuarioVacinaCadModel(
      id: idRelacaoUsuarioExame,
      idUsuario: controllerUsuario.usuarioLogado.idUuid,
      idVacina: exameSelecionadaNoDropDown!.id,
      dataVacinacao: dataSelecionadaSemFormatar,
      urlFotoVacina: urlImagemFotoVacina,
    );
    bool foiAtualizada =
        await RepositorioVacina().atualizarVacinaUsuario(usuarioVacina);

    estaAtualizandoVacina = false;
    update();

    if (foiAtualizada) {
      Get.back();
      mySnackBar(
        'Muito bem!',
        'Vacina atualizada!',
        Icons.check,
        Colors.green,
      );
    } else {
      mySnackBar(
        'Ops!',
        'Erro ao atualizar Vacina!!',
        Icons.error,
        Colors.red,
      );
    }
  }
*/
  void escolherEditarCadastrar() {
    if (iniciouEdicao) {
      // atualizarVacinaUsuario();
    } else {
      cadastrarExameUsuario();
    }
  }

  String? urlImagemFotoVacina = 'no';
  void carregarUrlImagemFotoVacina(String url) {
    urlImagemFotoVacina = url;
  }

  void verFotoVacina({String? urlImage}) async {
    print('URL A CHAMAR: $urlImagemFotoVacina');

    if (!await launch(urlImagemFotoVacina ?? urlImage!))
      throw 'Could not launch $urlImagemFotoVacina';
  }

  
}
