import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/screen/home/home_bloc.dart';
import 'package:flutter_research/widget/abi_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc;

  @override
  void initState() {
    _bloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  // initState
  @override
  Widget build(BuildContext context) {
    return ABIScaffold(
      appbar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: Colors.green,
        ),
      ),
      body: Container(),
    );
  }
}
