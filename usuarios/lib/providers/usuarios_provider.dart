import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usuarios/data.dart';

import 'package:usuarios/models/usuario_model.dart';

class UsuariosNotifier extends StateNotifier<List<Usuario>> {
  UsuariosNotifier() : super(usuariosDummy);
}

final usuariosProvider =
    StateNotifierProvider<UsuariosNotifier, List<Usuario>>((ref) {
  return UsuariosNotifier();
});
