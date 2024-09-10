import 'package:flutter/cupertino.dart';

class CustomCornerTopHorizontalTicket extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(0)));

    path.addOval(
      Rect.fromCircle(center: const Offset(0, 0), radius: 20),
    );

    path.addOval(Rect.fromCircle(center: Offset(size.width, 0), radius: 20));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
