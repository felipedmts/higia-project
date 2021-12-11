import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/controllers/vacina_controllers.dart';
import 'package:higia/repositorios/repositorio_firebase.dart';
import 'package:image_picker/image_picker.dart';

final controllerUsuario = Get.put(ControllerUsuario());
final vacinaController = Get.put(VacinaController());

class ControllerCamera extends GetxController {
  ImagePicker picker = ImagePicker();

  String fotoDe = 'no';

  ControllerCamera() {
    picker = ImagePicker();
  }

  XFile? xFile = XFile('no');
  var fotoCapturada;

  void fotoDaCamera(String fotoDe) async {
    fotoDe = fotoDe;
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    fotoCapturada = File(xFile!.path);
    update();
    if (fotoCapturada != null) {
      enviarParaFirebase(fotoDe);
    }
  }

  void fotoDaGaleria() async {
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    fotoCapturada = File(xFile!.path);
    update();
  }

  void enviarParaFirebase(String fotoDe) async {
    final caminhoImagem = fotoCapturada!.path;
    String caminhoDoFirebase = '';
    TaskSnapshot? retornoEnvio;
    switch (fotoDe) {
      case 'perfilUsuario':
        caminhoDoFirebase =
            'usuarios/${controllerUsuario.usuarioLogado.email}/fotoPerfil/${DateTime.now()}';
        retornoEnvio = await RepositorioFirebase.uploadFile(
            caminhoDoFirebase, fotoCapturada);

//pegando o url da imagem salva no firebase para salvar no banco de dados
        retornoEnvio!.ref
            .getDownloadURL()
            .then((urlImage) => salvarUrlImageNoBanco(urlImage, fotoDe));
        break;
      case 'vacina':
        caminhoDoFirebase =
            'usuarios/${controllerUsuario.usuarioLogado.email}/fotoVacina/${DateTime.now()}';
        retornoEnvio = await RepositorioFirebase.uploadFile(
            caminhoDoFirebase, fotoCapturada);

        //carregarUrlImagemFotoVacina
        retornoEnvio!.ref.getDownloadURL().then((urlImage) =>
            vacinaController.carregarUrlImagemFotoVacina(urlImage));
        break;
      default:
    }
  }

  void salvarUrlImageNoBanco(String urlImage, String fotoDe) async {
    bool urlImageFoiSalva = false;
    switch (fotoDe) {
      case 'perfilUsuario':
        urlImageFoiSalva = await RepositorioFirebase().atualizarUrlImagemPerfil(
            controllerUsuario.usuarioLogado.email, urlImage);
        break;
      case 'vacina':
        break;
      default:
    }

    if (urlImageFoiSalva) {
      print('URL DA IMAGEM FOI SALVA NO BANCO');
    }
  }
}
