import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigator();
    super.initState();
  }
  _navigator()async{
    await Future.delayed(const Duration(milliseconds: 3000), (){
      if(Storage().getBool('firstOpen') == null){
        //Go to onbording screeing
        GoRouter.of(context).go('/login');
      }else{
        //Go to home page
        GoRouter.of(context).go('/home');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/chat.png")),
        ),
      ),
    );
  }
}

