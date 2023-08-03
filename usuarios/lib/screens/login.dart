import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usuarios/providers/usuarios_provider.dart';
import 'package:usuarios/screens/lista_screen.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();

  void _loginHandler() {
    final usuarios = ref.watch(usuariosProvider);
    if (_nomeController.text == usuarios[0].nome &&
        _senhaController.text == usuarios[0].senha) {
      print('pode entrar');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ListaScreen()));
          
    } else {
      print('dados incorretos');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final usuarios = ref.watch(usuariosProvider);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(label: Text('Nome')),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _senhaController,
                decoration: const InputDecoration(label: Text('Senha')),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    _loginHandler();
                  },
                  child: const Text('Entrar'))
            ],
          ),
        ),
      ),
    );
  }
}
