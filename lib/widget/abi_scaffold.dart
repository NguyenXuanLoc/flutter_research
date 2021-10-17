import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ABIScaffold extends StatelessWidget {
  final PreferredSizeWidget appbar;
  final Widget body;
  final Color backgroundColor;
  final bool isPaddingStatusBar;

  const ABIScaffold(
      {Key key,
      this.appbar,
      this.body,
      this.backgroundColor,
      this.isPaddingStatusBar = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      body: isPaddingStatusBar ? SafeArea(child: body) : body,
      resizeToAvoidBottomInset: false,
      appBar:
          appbar ?? PreferredSize(child: Container(), preferredSize: Size.zero),
    );
  }
}
