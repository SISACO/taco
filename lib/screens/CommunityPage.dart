import 'dart:math';

import 'package:Taco/reuse/NavBar.dart';
import 'package:Taco/sampleData/Data.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late bool _showFrontSide;
  late bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          title: Text(
            'Community',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: appTheme.black900),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/magnifier.svg",
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/notification-bell-svgrepo-com.svg",
                        width: 30,
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          "9+",
                          style:
                              TextStyle(fontSize: 9, color: appTheme.whiteA700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Container(
                width: 250,
                height: 180,
                decoration: BoxDecoration(
                    color: appTheme.blue200Af.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You both have same intrests",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appTheme.BlackTrans),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/squoval-blob.svg",
                                        width: 80,
                                        height: 80,
                                      ),
                                      Center(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(8),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/images/sisaco.jpg"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: RotatedBox(
                                      child: SvgPicture.asset(
                                        "assets/icons/shuffle-tracks-button-svgrepo-com.svg",
                                        width: 50,
                                        height: 50,
                                      ),
                                      quarterTurns: _flipXAxis ? 0 : 1,
                                    ),
                                    onPressed: _switchCard,
                                  ),
                                  Stack(alignment: Alignment.center, children: [
                                    SvgPicture.asset(
                                      "assets/icons/squoval-blob.svg",
                                      width: 80,
                                      height: 80,
                                    ),
                                    _buildFlipAnimation(),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "chat",
                                  style: TextStyle(color: appTheme.whiteA700),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appTheme.indigo400),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                  color: appTheme.blue200Af.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Looking for new connections?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appTheme.indigo400),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      SvgPicture.asset(
                        "assets/icons/person-plus-circle-fill-svgrepo-com.svg",
                        color: appTheme.indigo400,
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Your Communities',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appTheme.black900),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 30,
                        color: appTheme.blue200Af,
                      ),
                      hoverColor: appTheme.gray5099,
                    )
                  ],
                ),
              ),
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return conversation(
                      'https://via.placeholder.com/150',
                      chats[index]['name'],
                      chats[index]['msg'],
                      chats[index]['time'],
                      chats[index]["isOnline"]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changeRotationAxis() {
    setState(() {
      _flipXAxis = !_flipXAxis;
    });
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (currentChild, previousChildren) => Stack(
          children: [
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        ),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: "Front",
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: Image.asset("assets/images/sisaco.jpg"),
        ),
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.blue.shade700,
      faceName: "Nothing",
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child:
              Center(child: Text("Flutter", style: TextStyle(fontSize: 5.0))),
        ),
      ),
    );
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required Color backgroundColor}) {
    return Container(
      key: key,
      height: 60,
      width: 60,
      decoration: BoxDecoration(shape: BoxShape.rectangle),
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/sisaco.jpg"),
      ),
    );
    // return Container(
    //   key: key,
    //   decoration: BoxDecoration(
    //     color: backgroundColor,
    //     borderRadius: BorderRadius.circular(12.0),
    //   ),
    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       child,
    //       Positioned(
    //         bottom: 8.0,
    //         right: 8.0,
    //         child: Text(faceName),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget conversation(
      String url, String name, String message, String time, bool messageSeen) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 25.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(time),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(message)),
                      if (messageSeen)
                        Icon(
                          Icons.check_circle,
                          size: 16.0,
                          color: Colors.green,
                        ),
                      if (!messageSeen)
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
