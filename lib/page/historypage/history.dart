import 'package:flutter/material.dart';

class MyHistoryPage extends StatelessWidget {
  const MyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 65, 100),
        title: const Text('History'),
      ),
      body: const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('History hari ini'),
          ],
        
      )),
    );
  }
}