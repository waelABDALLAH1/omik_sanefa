
import 'dart:async';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';
import 'package:recipe_list/views/home.dart';

class MySplashPage extends StatefulWidget {
  @override
  _MySplashPageState createState() => _MySplashPageState();
}


class _MySplashPageState extends State<MySplashPage> {
  @override
  void initState() {
    super.initState();

    // Simulate a long-running task to show the splash screen
    Future.delayed(
      Duration(seconds: 1), // Adjust the duration as needed
          () async {
        showOverlay(context);
        await _loadData(); // Your asynchronous data loading function
        hideOverlay(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }
  Future<void> _loadData() async {
    // Simulate loading data
    await Future.delayed(Duration(seconds: 5));
  }
  void showOverlay(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            SizedBox(height:10),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
          ],
        );
      },
    );
  }

  void hideOverlay(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/1.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          // child: //FlutterLogo(size: 150),
        ),
      ),
    );
  }
}


