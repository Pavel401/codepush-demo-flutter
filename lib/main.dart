import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int noOfFlies = 0;

  @override
  void initState() {
    // TODO: implement initState
    retrieveValue();
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                noOfFlies++;
              });
              storeValue();
            },
            child: SvgPicture.asset('assets/svg/logo.svg'),
          ),
          appBar: AppBar(
            title: const Text('Shorebird Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/logo.svg',
                  height: 100,
                ),
                const SizedBox(height: 20),
                Text("Shore bird is flown $noOfFlies times")
              ],
            ),
          )),
    );
  }
}
