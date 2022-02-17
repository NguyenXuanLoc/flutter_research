import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research/screen/home/home_bloc.dart';
import 'package:flutter_research/screen/home/home_state.dart';
import 'package:flutter_research/utils/toast.dart';
import 'package:flutter_research/widget/abi_scaffold.dart';

import 'home_event.dart';

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _bloc,
      child: BlocListener(
        cubit: _bloc,
        listener: (context, state) {
          if (state is GetNoteState) {
            ToastUtils.toast("GetNoteState");
          } else if (state is SetNoteState) {
            ToastUtils.toast("SetNoteState");
          } else if (state is InitHomeState) {
            ToastUtils.toast("InitNoteState");
          }
        },
        child: ABIScaffold(
          appbar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                    color: Colors.blue,
                    height: 50,
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        _bloc.add(GetNoteEvent());
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    color: Colors.yellow,
                    height: 50,
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        _bloc.add(SetNoteEvent());
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
