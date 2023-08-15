import 'package:flutter/material.dart';
import 'package:flutter_application_share/screens/loginpage.dart';
import 'package:flutter_application_share/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello $finalEmail",
              style:const TextStyle(fontSize: 26),
            ),
            MaterialButton(
              color: Colors.lightBlue,
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Loginpage(),
                  ),
                );
              },
              child:const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
