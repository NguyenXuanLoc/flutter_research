import 'package:action_slider/action_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/compoment/custom_clip_path/custom_corner_bottom_horizontal_ticket.dart';
import 'package:flutter_research/social_comment.dart';
import 'package:flutter_research/test/test_binding.dart';
import 'package:flutter_research/test/test_controller.dart';
import 'package:flutter_research/test/test_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'compoment/custom_clip_path/line_dash_widget.dart';
import 'compoment/tear_up_the_ticket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: [
          GetPage(
            name: '/test',
            page: () => TestView(),
            binding: TestBinding(),
          ),
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  //kljsakjsdljf
  ////ksdjflkjskdljfkljdk
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scrollParent = false;
  TearUpTheTicketController? controller;
  var isReady = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => isReady = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 100, left: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 100),
                Wrap(
                  children: [
                    Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 1),
                            child: ClipPath(
                                clipper: CustomCornerBottomHorizontalTicket(),
                                child: Container(
                                    height: 140,
                                    width: 250,
                                    decoration: const BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    margin: const EdgeInsets.all(1))),
                          ),
                          const LineDashWidget(color: Colors.amberAccent)
                        ],
                      ),
                    )
                  ],
                ),
                TearUpTheTicket(
                  controllerCallback: (controller) =>
                      this.controller = controller,
                ),
                const Spacer(),
                ActionSlider.standard(
                    child: const Text('Slide to confirm'),
                    stateChangeCallback: (a, state, c) {
                      if (isReady) controller?.onSwipeCallBack(state.position);
                    }),
                const SizedBox(height: 30)
              ],
            )),
      ),
    );
/*      child: ElevatedButton(
        onPressed: () {
          showTestDialog();
        },
        child: Text("CLICK"),
      ),
    );*/
  }

  @override
  void didChangeDependencies() {
    print("TAG didChangeDependencies");
    super.didChangeDependencies();
  }

  void showCommentModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SocialCommentsWidget(
          myScrollController: DraggableScrollableController(),
        );
      },
    );
  }

  void showTestDialog() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (c) => Wrap(
              children: [
                Text("skl;dfjkldj"),
                Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red),
                Text('LKjklsdjfkkj'),
                Text("skl;dfjkldj"),
                Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red),
                Text('LKjklsdjfkkj'),
                Text("skl;dfjkldj"),
                Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red),
                Text('LKjklsdjfkkj'),
                Text("skl;dfjkldj"),
                Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red),
                Text('LKjklsdjfkkj'),
              ],
            ) /* Dismissible(
              onDismissed: (c) {
                Navigator.pop(context);
              },
              key: GlobalKey(),
              secondaryBackground: SizedBox(),
              background: Container(
                color: Colors.green,
              ),
              child: Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height - 200,
              ),
            )*/
        );
  }
}

var t = 0;
