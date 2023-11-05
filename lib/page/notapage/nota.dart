import 'package:flutter/material.dart';

class MyNotaPage extends StatelessWidget {
  const MyNotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 65, 100),
        title: const Text('Buat Nota'),
      ),
      body: const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('Buat Nota Now'),
          ],
        
      )),
    );
  }
}