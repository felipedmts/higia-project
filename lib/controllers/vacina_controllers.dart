import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/generalUse/my_formate_date.dart';
import 'package:higia/models/usuario_vacina_cad_model.dart';
import 'package:higia/models/usuario_vacina_model.dart';
import 'package:higia/models/vacina_model.dart';
import 'package:higia/repositorios/repositorio_vacina.dart';
import 'package:higia/views/componentes_uso_geral/mySnackBar.dart';
import 'package:higia/views/vacina/registrar_editar_vacina_alerta.dart';
import 'package:url_launcher/url_launcher.dart';

final controllerUsuario = Get.put(ControllerUsuario());

class VacinaController extends GetxController {
  List<VacinaModel> listaTodasVacinas = [];
  TextEditingController dataController =
      TextEditingController(text: myFormateDateNoHour(DateTime.now()));

  void buscarListaTodasVacinas(String registrarEditar) async {
    //
    listaTodasVacinas = await RepositorioVacina().buscarListaTodasVacinas();

//DropDown da erro se não carregar ele com objeto da mesma lista que o compõe.
//não funcionou mesmo criando novo objeto do mesmo tipo...
    VacinaModel? vacinaASerCarregadaNoDropDown = registrarEditar == 'editar'
        ? listaTodasVacinas
            .firstWhere((vacina) => vacina.id == idVacinaSelecionadaEdicao)
        : listaTodasVacinas[0];
    setarVacinaSelecionadaNoDropDown(vacinaASerCarregadaNoDropDown);
  }

  VacinaModel? vacinaSelecionadaNoDropDown;
  void setarVacinaSelecionadaNoDropDown(VacinaModel? newValue) {
    vacinaSelecionadaNoDropDown = newValue;
    print(
        'VERIFICAR DADOS DA VACINA SELECIONADA vacinaSelecionadaNoDropDown => ${vacinaSelecionadaNoDropDown!.toJson()}');
    update();
  }

  DateTime? dataSelecionadaSemFormatar = DateTime.now();
  void setarDataselecionada(DateTime? dataParametro) {
    dataSelecionadaSemFormatar = dataParametro;
    dataController.text = myFormateDateNoHour(dataParametro);
    update();
  }

  bool estaCadastrandoVacina = false;

  void cadastrarVacinaUsuario() async {
    estaCadastrandoVacina = true;
    update();
    UsuarioVacinaCadModel usuarioVacina = UsuarioVacinaCadModel(
      idUsuario: controllerUsuario.usuarioLogado.idUuid,
      idVacina: vacinaSelecionadaNoDropDown!.id,
      dataVacinacao: dataSelecionadaSemFormatar,
      urlFotoVacina: urlImagemFotoVacina,
    );
    bool foiCadastrada =
        await RepositorioVacina().cadastrarVacinaUsuario(usuarioVacina);

    estaCadastrandoVacina = false;
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

  initSubscriptionCarregarListaVacinasPorUsuario() {
    RepositorioVacina().iniSubscriptionCarregarListaVacinasPorUsuario(
        controllerUsuario.usuarioLogado.idUuid);
  }

//CARREGANDO VACINAS DO USUÁRIO
  List<UsuarioVacinaModel>? listaVacinasPorUsuario = [];
  void carregarListaVacinasPorUsuario(
      List<UsuarioVacinaModel>? usuarioVacinaList) {
    listaVacinasPorUsuario = usuarioVacinaList;
    //  print(        'TAMANHO DA listaVacinasPorUsuario: ${listaVacinasPorUsuario!.length}');
    update();
  }

//PROCESSOD DE EDITAR
  bool iniciouEdicao = false;
  int? idVacinaSelecionadaEdicao;
  String? idRelacaoUsuarioVacina;
  setarVacinaSelecionadaParaEdicao(
      UsuarioVacinaModel vacinaParam, BuildContext context) {
    iniciouEdicao = true;
    idVacinaSelecionadaEdicao = vacinaParam.vacina!.id;
    idRelacaoUsuarioVacina = vacinaParam.id;
    dataController.text = myFormateDateNoHour(vacinaParam.dataVacinacao);
    dataSelecionadaSemFormatar = vacinaParam.dataVacinacao;
    urlImagemFotoVacina = vacinaParam.urlFotoVacina!;

    if (listaTodasVacinas.isEmpty) {
      buscarListaTodasVacinas('editar');
    } else {
      vacinaSelecionadaNoDropDown = listaTodasVacinas
          .firstWhere((vacina) => vacina.id == vacinaParam.vacina!.id);
    }

    registrarEditarVacinaAlerta(context);
  }

  bool estaAtualizandoVacina = false;
  void atualizarVacinaUsuario() async {
    estaAtualizandoVacina = true;
    update();
    UsuarioVacinaCadModel usuarioVacina = UsuarioVacinaCadModel(
      id: idRelacaoUsuarioVacina,
      idUsuario: controllerUsuario.usuarioLogado.idUuid,
      idVacina: vacinaSelecionadaNoDropDown!.id,
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

  void escolherEditarCadastrar() {
    if (iniciouEdicao) {
      atualizarVacinaUsuario();
    } else {
      cadastrarVacinaUsuario();
    }
  }

  String urlImagemFotoVacina = 'no';
  void carregarUrlImagemFotoVacina(String url) {
    urlImagemFotoVacina = url;
  }

  void verFotoVacina() async {
    print('URL A CHAMAR: $urlImagemFotoVacina');

    if (!await launch(urlImagemFotoVacina))
      throw 'Could not launch $urlImagemFotoVacina';
  }
}
