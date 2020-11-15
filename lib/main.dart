import 'package:CoolQuiz/helper/authenticate.dart';
import 'package:CoolQuiz/helper/helperfunctions.dart';
import 'package:CoolQuiz/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CoolQuiz());
}

class CoolQuiz extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CoolQuizState createState() => _CoolQuizState();
}

class _CoolQuizState extends State<CoolQuiz> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUIZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn != null
          ? userIsLoggedIn
              ? HomePage()
              : Authenticate()
          : Container(
              child: Center(
                child: Authenticate(),
              ),
            ),
    );
  }
}
