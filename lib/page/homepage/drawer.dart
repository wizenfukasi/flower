import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 160, 65, 100),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/lotus.png'))),
          ),
          const Text(
            "FLOWER APP",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
          ),
          const Text(
            "Bikin Nota Simple",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
          ),
        ],
      ),
    );
  }
}
