import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:higia/repositorios/repositorio_firebase.dart';
import 'package:image_picker/image_picker.dart';

final controllerUsuario = Get.put(ControllerUsuario());

class ControllerCamera extends GetxController {
  ImagePicker picker = ImagePicker();

  ControllerCamera() {
    picker = ImagePicker();
  }

  XFile? xFile = XFile('no');
  var fotoCapturada;

  fotoDaCamera() async {
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    fotoCapturada = File(xFile!.path);
    update();
    if (fotoCapturada != null) {
      enviarParaFirebase();
    }
  }

  fotoDaGaleria() async {
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    fotoCapturada = File(xFile!.path);
    update();
  }

  enviarParaFirebase() async {
    final caminhoImagem = fotoCapturada!.path;
    final caminhoDoFirebase =
        'fotos_perfil_usuario/${controllerUsuario.usuarioLogado.email}/fotoPerfil/${DateTime.now()}';
    TaskSnapshot? retornoEnvio =
        await RepositorioFirebase.uploadFile(caminhoDoFirebase, fotoCapturada);

//pegando o url da imagem salva no firebase para salvar no banco de dados
    retornoEnvio!.ref
        .getDownloadURL()
        .then((urlImage) => salvarUrlImageNoBando(urlImage));
  }

  salvarUrlImageNoBando(String urlImage) async {
    bool urlImageFoiSalva = await RepositorioFirebase()
        .atualizarUrlImagemPerfil(
            controllerUsuario.usuarioLogado.email, urlImage);

    if (urlImageFoiSalva) {
      print('URL DA IMAGEM FOI SALVA NO BANCO');
    }
  }
}
