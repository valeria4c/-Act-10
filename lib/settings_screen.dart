import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: const Center(
        child: Text(
          'Aquí va el contenido de la pantalla de Ajustes.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
