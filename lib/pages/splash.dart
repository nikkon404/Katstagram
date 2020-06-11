import 'package:flutter/material.dart';
import 'package:katstagram/pages/home.dart';
import 'package:katstagram/utils/const.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var _iconSize = 50.0;

  var _logoSize = 50.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3), () {
      setState(() {
        _iconSize = 200;
        _logoSize = 300;
        Future.delayed(Duration(milliseconds: 1200), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 900),
              width: _iconSize,
              child: Image.asset(
                iconLogo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: appName,
                child: AnimatedContainer(
                  curve: Curves.easeInExpo,
                  duration: Duration(milliseconds: 900),
                  width: _logoSize,
                  child: Image.asset(
                    mainLogo,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
