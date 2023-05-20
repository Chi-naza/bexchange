import 'dart:async';

import 'package:bexchange/views/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  // splash screen implementation
  void startTimer(){
    Timer(const Duration(seconds: 5), () { 
      Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset('assets/images/playstore.png'),
              ),
              const SizedBox(height: 10),
              Text(
                'BeXchange',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}