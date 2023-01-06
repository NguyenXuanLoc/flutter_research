import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const IntrinsicWidth(
            child: TextField(
              maxLines: 1,
              maxLength: 11,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIconConstraints:
                    BoxConstraints(maxWidth: 25, minWidth: 5, maxHeight: 70),
                prefixIcon: Align(
                  alignment: Alignment.topLeft,
                  child: Text('S/',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.w600)),
                ),
                counterText: "",
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "",
                hintTextDirection: TextDirection.ltr,
              ),
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 70,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget test(int second) {
    return Wrap(
      /*  mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,*/
      direction: Axis.horizontal,
      children: [
        const Text(
          "s/",
          style:
              TextStyle(fontSize: 40, fontWeight: FontWeight.w600, height: 1),
        ),
        TextFormField()
        /*  Text(
          "$second",
          style: const TextStyle(
              fontSize: 100, fontWeight: FontWeight.w600, height: 1),
        )*/
      ],
    );
  }
}
