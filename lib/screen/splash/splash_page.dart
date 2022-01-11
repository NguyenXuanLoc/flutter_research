import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research/screen/home/home_page.dart';
import 'package:flutter_research/screen/splash/splash_bloc.dart';
import 'package:flutter_research/screen/splash/splash_event.dart';
import 'package:flutter_research/screen/splash/splash_state.dart';
import 'package:flutter_research/utils/navigator.dart';
import 'package:flutter_research/utils/toast.dart';
import 'package:flutter_research/widget/abi_scaffold.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  SplashBloc _bloc;

  @override
  void initState() {
    _bloc = SplashBloc();
    _bloc.add(GetApiKeySplashEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _bloc,
      child: Center(
        child: BlocListener(
          cubit: _bloc,
          listener: (context, state) {
            if (state is GetApiKeyState) {
              ToastUtils.toast("Load data success: ${state.key.apiKey}");
              NavigatorUtils.navigatorRightToLeft(
                  context: context, goto: HomePage());
            } else if (state is ErrorSplashState) {
              ToastUtils.toast("Load data fail, please try again !!");
            }
          },
          child: ABIScaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
