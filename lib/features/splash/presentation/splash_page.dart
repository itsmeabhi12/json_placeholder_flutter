import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          FlutterLogo(size: 100),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
