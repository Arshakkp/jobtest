import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobtest/login-page.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: ElevatedButton(
        child: Text("Tap to Login"),
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue, backgroundColor: Colors.white),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginWidget(),
              ));
        },
      )),
    );
  }
}
