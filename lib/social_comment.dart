import 'dart:math';

import 'package:flutter/material.dart';

class SocialCommentsWidget extends StatefulWidget {
  final DraggableScrollableController myScrollController;
  final minChildSize = 0.6;
  final maxChildSize = 0.92;

  const SocialCommentsWidget({Key? key, required this.myScrollController})
      : super(key: key);

  @override
  State<SocialCommentsWidget> createState() => _SocialCommentsWidgetState();
}

class _SocialCommentsWidgetState extends State<SocialCommentsWidget> {
  var isClose = false;

  @override
  void initState() {
    widget.myScrollController.addListener(() {
      if (widget.myScrollController.size < 0.25 && !isClose) {
        print("TAG srfsfdsdf");
        Navigator.pop(context);
        isClose = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: [widget.minChildSize, widget.maxChildSize],
      expand: false,
      initialChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      controller: widget.myScrollController,
      builder: (context, scrollController) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 28.0,
                  child: Center(
                    child: Container(
                      width: 44.0,
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: ListView(
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.manual,
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: scrollController,
                      children: [
                        ...List.generate(
                          4,
                          (index) => SocialCommentWidget(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void animatedShowFullCommentList() {
    widget.myScrollController.animateTo(
      widget.maxChildSize,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInBack,
    );
  }
}

class SocialCommentWidget extends StatefulWidget {
  const SocialCommentWidget({Key? key}) : super(key: key);

  @override
  State<SocialCommentWidget> createState() => _SocialCommentWidgetState();
}

class _SocialCommentWidgetState extends State<SocialCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return _commentItem();
  }

  Widget _commentItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SizedBox(
        child: Column(
          children: [
            _parentCommentWidget(),
            _childCommentWidget(false),
            _childCommentWidget(true),
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _baseCommentWidget({required bool isParentComment}) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isParentComment)
            const SizedBox(
              height: 12.0,
            ),
          Image.network(
            'https://i.insider.com/568d4264dd0895a83d8b45eb?width=1048&format=jpeg',
            height: 40.0,
            width: 40.0,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Expanded(
              child: Container(
            width: 1.0,
            color: isParentComment ? Colors.grey : Colors.transparent,
          ))
        ],
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(top: isParentComment ? 0.0 : 12.0, left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ron Weasley',
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'I have seen this doctor before, very good expertise!',
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                Text(
                  '2 hours ago',
                ),
                const SizedBox(
                  width: 4.0,
                ),
                InkWell(
                  child: Text(
                    "RETRY",
                  ),
                  onTap: () => {},
                )
              ],
            )
          ],
        ),
      ))
    ];
  }

  Widget _parentCommentWidget() {
    return Column(
      children: [
        SizedBox(
          child: IntrinsicHeight(
            child: Row(
              children: _baseCommentWidget(isParentComment: true),
            ),
          ),
        )
      ],
    );
  }

  Widget _childCommentWidget(bool isLast) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 19.5),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.0,
                      height: 32.0,
                      color: Colors.grey,
                    ),
                    Container(
                      width: 26.0,
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: Container(
                      width: 1.0,
                      color: isLast ? Colors.transparent : Colors.grey,
                    ))
                  ],
                ),
                const SizedBox(
                  width: 4.0,
                ),
                for (Widget item in _baseCommentWidget(isParentComment: false))
                  item
              ],
            ),
          ),
        )
      ],
    );
  }
}
