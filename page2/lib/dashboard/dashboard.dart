import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileApp extends StatefulWidget {
  final String? ipmaquina;
  const FileApp({super.key, this.ipmaquina});

  @override
  _FileAppState createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  TextEditingController _fileController = TextEditingController();
  late final String ipmaquina;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileController.text = result.files.single.path ?? '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ipmaquina = widget.ipmaquina!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Envío de archivos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'En esta parte podrás ingresar a los archivos de tu dispositivo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _fileController,
                    decoration: InputDecoration(
                      labelText: 'Archivo seleccionado',
                    ),
                    readOnly: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _pickFile,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // Texto blanco
                    ),
                    child: Text('Seleccionar Archivo'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para enviar el archivo
                      if (_fileController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Archivo enviado: ${_fileController.text}')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Por favor selecciona un archivo')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // Texto blanco
                    ),
                    child: Text('Enviar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
