import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineDashWidget extends StatelessWidget {
  final Color color;

  const LineDashWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < 4; i++)
            Container(height: 5, width: 12, color: color)
        ],
      ),
    );
  }
}
