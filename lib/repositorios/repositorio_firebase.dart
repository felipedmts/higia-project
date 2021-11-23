import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:higia/constants/constants.dart';
import 'package:higia/models/usuarioModel.dart';

class RepositorioFirebase {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  atualizarUrlImagemPerfil(String? emailUsuario, String urlImagemPerfil) async {
    String myMutation = """
            mutation MyMutation {
              update_usuarios(
                where: {
                  email: {_eq: "$emailUsuario"}},
                _set: {url_imagem_perfil: "$urlImagemPerfil"}) 
              {
                affected_rows
              }
            }
            """;

    print('QUERY ENVIADA PARA ATUALIZAR USUARIO: \n $myMutation');

    var retornoAtualizarUsuario =
        await myConfigHasuraConnect().mutation(myMutation);

    if (retornoAtualizarUsuario['data']['affected_rows'] == 0) {
      print(
          'RETORNO DO ATUALIZAR USUARIO FALSE \n ${retornoAtualizarUsuario['data']}');
      return false;
    } else {
      print(
          'RETORNO DO ATUALIZAR USUARIO TRUE \n ${retornoAtualizarUsuario['data']}');

      return true;
    }
  }
}
