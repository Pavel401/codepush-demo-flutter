import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int noOfFlies = 0;
  bool useMaterial3 = true; // Default value for useMaterial3

  @override
  void initState() {
    retrieveValue();
    retrieveUseMaterial3();
    super.initState();
  }

  storeValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('counter', noOfFlies);
  }

  retrieveValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int? counter = prefs.getInt('counter');

    if (counter != null) {
      setState(() {
        noOfFlies = counter;
      });
    }
  }

  storeUseMaterial3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('useMaterial3', useMaterial3);
  }

  retrieveUseMaterial3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool? useMaterial3Value = prefs.getBool('useMaterial3');

    if (useMaterial3Value != null) {
      setState(() {
        useMaterial3 = useMaterial3Value;
      });
    }
  }

  void toggleMaterial3Value() {
    setState(() {
      useMaterial3 = !useMaterial3;
    });
    storeUseMaterial3();
  }

  bool launchAnimation = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shorebird Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: useMaterial3),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              noOfFlies++;
              launchAnimation = !launchAnimation;
            });
            storeValue();
          },
          child: SvgPicture.asset('assets/svg/logo.svg'),
        ),
        appBar: AppBar(
          title: const Text('Shorebird Demo'),
          actions: [
            IconButton(
              onPressed: toggleMaterial3Value,
              icon: Icon(useMaterial3 ? Icons.toggle_on : Icons.toggle_off),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Bounce(
                animate: launchAnimation,
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Shorebirds have flown $noOfFlies times.",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
