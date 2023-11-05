
//import 'package:flower/page/homepage/home.dart';
// import 'package:flower/page/loginpage/login.dart';
import 'package:flower/page/loginpage/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const SignInScreen()));
     }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 219, 235),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/lotus.png', height: 200),
          Text('FLOWER APP',
          style: GoogleFonts.tenorSans(fontSize: 24, letterSpacing: 5 ),
          ), 
        
        const SizedBox(height: 25),
        const CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 0, 0, 0)),
        )
        ],
        )
      ),
    );
  }
}

