import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/social_comment.dart';
import 'package:flutter_research/test/test_binding.dart';
import 'package:flutter_research/test/test_controller.dart';
import 'package:flutter_research/test/test_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

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
  @override
  Widget build(BuildContext context) {
/*    return Center(
      child:  Container(
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
          children: [
            Text("sdkljfldfj"),
            // Container(height: 10, color: C?olors.red),
            Container(
              height: 20,
              child: Text("sdlfk"),
              color: Colors.red,
            )
          ],
        ),
      ),
    );*/
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 100, left: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(TestView(), binding: BindingsBuilder(() {
                      Get.put(TestController());
                    }));
                  },
                  child: Container(
                      height: 24,
                      child: Text(
                        'Auto',
                        style: TextStyle(
                          height: 0.77,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
                InkWell(
                  onTap: () {
                    //Todo
                    showCommentModalBottomSheet(context);
                    // Get.create(() => TestController());
                    // Get.to(TestView(), binding: BindingsBuilder(() {}));
                  },
                  child: Stack(
                    children: [
/*                    Positioned.fill(
                          child: Container(
                        color: Colors.red,
                      )),*/
                      Text(
                        "C",
                        style: TextStyle(
                            decorationColor: Colors.red,
                            backgroundColor: Colors.red,
                            fontSize: 60,
                            height: 1.2,
                            //SETTING THIS CAN SOLVE YOUR PROBLEM
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Column(
                //       children: [
                //         Container(
                //           width: 30,
                //           height: 30,
                //           color: Colors.red,
                //         )
                //       ],
                //     ),
                //     SizedBox(width: 30),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //           width: 30,
                //           height: 30,
                //           color: Colors.red,
                //         ),
                //         Text(
                //           "kl;sfdjskldjfskdfj",
                //           style: TextStyle(fontSize: 13),
                //         )
                //       ],
                //     )
                //   ],
                // ),
                // Container(
                //   height: 60,
                //   width: 60,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       color: Colors.deepPurple,
                //       borderRadius: BorderRadius.circular(100)),
                //   child: Transform.scale(
                //     scale: 6,
                //     child: const Text("N",
                //         style: TextStyle(color: Colors.white),
                //         textAlign: TextAlign.center),
                //   ),
                // ),
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
