import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/compoment/custom_clip_path/line_dash_widget.dart';

import 'custom_clip_path/custom_corner_bottom_horizontal_ticket.dart';
import 'custom_clip_path/custom_corner_top_horizontal_ticket.dart';

class TearUpTheTicketController {
  Function(double)? swipeCallback;

  void onSwipeCallBack(double value) {
    swipeCallback?.call(value);
  }
}

class TearUpTheTicket extends StatefulWidget {
  final Function(TearUpTheTicketController) controllerCallback;

  const TearUpTheTicket({Key? key, required this.controllerCallback})
      : super(key: key);

  @override
  State<TearUpTheTicket> createState() => _TearUpTheTicketState();
}

class _TearUpTheTicketState extends State<TearUpTheTicket> {
  var controller = TearUpTheTicketController();
  double rotationZValue = 0;

  @override
  void initState() {
    controller.swipeCallback = (p0) {
      if (mounted) setState(() => rotationZValue = p0);
    };
    widget.controllerCallback.call(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: rotationZValue * 180, left: rotationZValue * 150),
        child: Transform(
            alignment: Alignment.topLeft,
            transform: Matrix4.rotationZ(rotationZValue * 1.2),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: ClipPath(
                      clipper: CustomCornerTopHorizontalTicket(),
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            width: 250,
                            height: 140,
                          ))),
                ),
                const LineDashWidget(color: Colors.amberAccent)
              ],
            )));
  }
}
