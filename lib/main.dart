import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Custom Scroll View'),
          ),
          body: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.overlay),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    // color: Colors.red,
                  ),
                ),
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(1), BlendMode.srcIn),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.grey, BlendMode.saturation),
                      child: SizedBox(
                        height: 100,
                        child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          fit: BoxFit.cover,
                        ),
                        width: MediaQuery.of(context).size.width,
                      )),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Unblurred',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: 1, sigmaY: 1, tileMode: TileMode.decal),
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Blurred',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))),
    );
  }

  int count = 0;

  Widget test() {
    count++;
    print("TAG SliverToBoxAdapter: $count");
    return Container(
      height: 200,
      color: Colors.blue,
    );
  }
}
