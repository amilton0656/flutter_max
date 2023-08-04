import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usuarios/data.dart';

import 'package:usuarios/models/usuario_model.dart';

class UsuariosNotifier extends StateNotifier<List<Usuario>> {
  UsuariosNotifier() : super(usuariosDummy);

bool isAuthorized(String nome, String senha) {
  bool result = false;

  usuariosDummy.map((usu) {
    if (usu.nome == nome && usu.senha == senha) {
      result = true;
      return;
    }
  });

  return result;
}

}


final usuariosProvider =
    StateNotifierProvider<UsuariosNotifier, List<Usuario>>((ref) {
  return UsuariosNotifier();
});
