import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class NavigatorUtils {
  static void navigatorLeftToRight(
      {BuildContext context, StatefulWidget goto, bool removeOldPage = false}) {
    if (removeOldPage) {
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.leftToRight, child: goto));
    } else
      Navigator.push(context,
          PageTransition(type: PageTransitionType.leftToRight, child: goto));
  }

  static void navigatorRightToLeft(
      {BuildContext context, StatefulWidget goto}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: goto,
            duration: Duration(milliseconds: 200)));
  }

  static Future<void> navigatorLeftToRightAsync(
      {BuildContext context, StatefulWidget goto}) async {
    await Navigator.push(context,
        PageTransition(type: PageTransitionType.leftToRight, child: goto));
  }

  static dynamic navigatorLeftToRightReturn(
      {BuildContext context, StatefulWidget goto}) async {
    return await Navigator.push(context,
        PageTransition(type: PageTransitionType.leftToRight, child: goto));
  }

  static dynamic popSendData({BuildContext context, dynamic data}) {
    Navigator.pop(context, data);
  }

  static void navigatorRemoveUntil(
      {BuildContext context, StatefulWidget goto}) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(type: PageTransitionType.leftToRight, child: goto),
        (Route<dynamic> route) => false);
  }

  static void popNavigator({BuildContext context}) {
    Navigator.of(context).pop();
  }
}
