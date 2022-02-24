import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ABIScaffold extends StatefulWidget {
  final Widget body;

  const ABIScaffold({Key key, this.body}) : super(key: key);

  @override
  _ABIScaffoldState createState() => _ABIScaffoldState();
}

class _ABIScaffoldState extends State<ABIScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.body,
      ),
    );
  }
}
