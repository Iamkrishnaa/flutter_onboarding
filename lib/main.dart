import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:on_boarrding/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:on_boarrding/utilities/intro_model.dart';
import 'package:on_boarrding/screens/on_boarding.dart';

void main() {
  runApp(MaterialApp(
    home: GuideToTermuxTools(),
    debugShowCheckedModeBanner: false,
  ));
}

class GuideToTermuxTools extends StatefulWidget {
  @override
  _GuideToTermuxToolsState createState() => _GuideToTermuxToolsState();
}

class _GuideToTermuxToolsState extends State<GuideToTermuxTools> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnBoardingWidget()));
    }
  }

  @override
  void initState() {
    setState(() {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    });
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class OnBoardingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoarding(
        bgColor: Color(0xff2630bd),
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new HomePage()));
        },
        getStartedClicked: (value) {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new HomePage()));
        },
      ),
    );
  }

  final pages = [
    IntroModel(
        title: 'Choose your item',
        description:
            'Easily find your grocery items and you will get delivery in wide range',
        titleColor: Colors.white,
        descripColor: const Color(0xFFfaf8eb),
        imagePath: 'assets/images/onboarding1.png'),
    IntroModel(
        title: 'Pick Up or Delivery',
        description:
            'We make ordering fast, simple and free-no matter if you order online or cash',
        titleColor: Colors.white,
        descripColor: const Color(0xFFfaf8eb),
        imagePath: 'assets/images/onboarding2.png'),
    IntroModel(
        title: 'Pay quick and easy',
        description: 'Pay for order using credit or debit card',
        titleColor: Colors.white,
        descripColor: const Color(0xFFfaf8eb),
        imagePath: 'assets/images/onboarding0.png'),
  ];
}
