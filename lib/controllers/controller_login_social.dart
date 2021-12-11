import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:higia/controllers/controller_usuario.dart';
import 'package:google_sign_in/google_sign_in.dart';

final controllerUsuario = Get.put(ControllerUsuario());

class ControllerLoginSocial extends GetxController {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user;

  void googleLogin() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credenciais = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final usuarioRetornado =
        await FirebaseAuth.instance.signInWithCredential(credenciais);

   // print('USUÁRIO RETORNADO DO GOOGLE: ${usuarioRetornado.user!.displayName}');
    controllerUsuario.buscarListasTiposSanguineaESexo();
    controllerUsuario.carregarUsuarioDoLoginSocial(usuarioRetornado.user);
    update();
  }
}
