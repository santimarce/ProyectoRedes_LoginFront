import 'package:flutter/material.dart';

import '../login/login_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _ipController =
      TextEditingController(); // Controlador para el TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'assets/yavirac_logo.jpg', // Asegúrate de que la ruta sea correcta
                height: 100,
              ),
              const SizedBox(height: 20),
              // Welcome Text
              const Text(
                'BIENVENIDO A TU ACCESO REMOTO',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Icon
              const Icon(
                Icons.router,
                size: 100,
              ),
              const SizedBox(height: 20),
              // Off Point Text
              const Text(
                'OFF POINT',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // IP Input Field
              TextField(
                controller: _ipController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP DE SU MAQUINA',
                  prefixIcon: Icon(Icons.computer),
                ),
              ),
              const SizedBox(height: 20),
              // Ingresar Button with Black Border
              OutlinedButton(
                onPressed: () {
                  final ipText = _ipController.text;
                  // Navegar al widget LOGIN con el texto IP
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(ipmaquina: ipText),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Colors.black), // Borde de color negro
                ),
                child: const Text('Ingresar'),
              ),
              const SizedBox(height: 10),
              // Footer Text
              const Text(
                'BY YAVIRAC',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
