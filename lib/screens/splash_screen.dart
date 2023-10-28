import 'dart:async';

import 'package:covidstat/screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 4), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    height: 0.60 * height,
                    width: 0.90 * width,
                    child: Image(image: AssetImage('images/virus.png')),
                  ),
                  builder: ((context, child) => Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      ))),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Text(
              'Covid Sewa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
