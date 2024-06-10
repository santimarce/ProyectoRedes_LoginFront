// pages/login/login_page.dart

import 'package:flutter/material.dart';
import 'package:page2/login/login_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/logo.jpeg',
                height: 160.0,
                width: 160.0,
              ), // Ajusta el tamaño según tus necesidades
              const SizedBox(height: 30.0),
              const Text(
                'INICIA SESIÓN EN TU CUENTA',
                style: TextStyle(
                  fontSize: 24.0, // Tamaño de fuente más grande
                  fontWeight: FontWeight.bold, // Texto en negrita
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'USUARIO O CORREO',
                  prefixIcon: const Icon(Icons.person), // Ícono de persona
                  fillColor: Colors.grey[200], // Fondo gris claro
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!), // Bordes gris oscuro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un usuario o correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'CONTRASEÑA',
                  prefixIcon: const Icon(Icons.password), // Ícono de persona
                  fillColor: Colors.grey[200], // Fondo gris claro
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey[800]!), // Bordes gris oscuro
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Iniciar sesión con los datos ingresados
                    final loginProvider = Provider.of<LoginProvider>(context);
                    loginProvider.login(
                        _emailController.text, _passwordController.text);
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.black), // Fondo negro
                  foregroundColor:
                      WidgetStateProperty.all(Colors.white), // Letras blancas
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Contorno cuadrado
                  )),
                  elevation: WidgetStateProperty.all(4.0), // Sombreado
                  overlayColor: WidgetStateProperty.all(
                      Colors.grey[800]), // Color de superposición
                  padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15)), // Aumentar padding
                  minimumSize: WidgetStateProperty.all(const Size(160, 60)),
                ),
                child: const Text('INGRESAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'username',
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, color: Colors.red),
        hintStyle: const TextStyle(color: Colors.red),
        hintText: 'NICK O SOBRENOMBRE',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
