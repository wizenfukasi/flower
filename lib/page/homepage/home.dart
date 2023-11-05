import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower/page/loginpage/signin.dart';
import 'package:flutter/material.dart';
import 'package:flower/page/homepage/drawer.dart';
import 'package:flower/page/historypage/history.dart';
import 'package:flower/page/notapage/nota.dart';
import 'package:flower/page/pelangganpage/pelanggan.dart';
import 'package:flower/page/analistikpage/analistik.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState () => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 160, 65, 100),
        title: Text("HomePage", style: GoogleFonts.taiHeritagePro(fontSize: 24),),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: (){Navigator.pop(context);},
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHistoryPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.analytics_outlined),
                title: const Text('analistik'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAnalistikPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: (){
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                  });
                },
              ),
              
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyNotaPage()));
              },
              splashColor: const Color.fromARGB(255, 255, 165, 195),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.receipt_long, size: 70, color: Colors.black,),
                    Text("Buat Nota", style: TextStyle(fontSize: 17),)
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPelangganPage()));
              },
              splashColor: const Color.fromARGB(255, 255, 165, 195),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.contacts_outlined, size: 70, color: Colors.black,),
                    Text("Pelanggan", style: TextStyle(fontSize: 17),)
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
