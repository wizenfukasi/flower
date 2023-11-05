import 'package:flutter/material.dart';

class MyAnalistikPage extends StatelessWidget {
  const MyAnalistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 65, 100),
        title: const Text('Analistik'),
      ),
      body: const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('Analistik Bulan ini'),
          ],
        
      )),
    );
  }
}