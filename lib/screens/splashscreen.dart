import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_share/screens/Homepage.dart';
import 'package:flutter_application_share/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var optainedEmail = sharedPreferences.getString('email');

    setState(() {
      finalEmail = optainedEmail;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            if (finalEmail == null) {
              return const Loginpage();
            } else {
              return const HomePage();
            }
          },
        ));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Icon(Icons.local_activity),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
