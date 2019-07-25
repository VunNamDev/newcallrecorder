import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:newcallrecorder/modal/FileItem.dart';
import 'package:newcallrecorder/screens/MenuScreen.dart';
import 'package:newcallrecorder/util/ButtonOpacity.dart';
import '../store/AppStore.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  TabController tabController;
  static const platform = const MethodChannel('samples.flutter.dev');
  AudioPlayer audioPlugin;
  int tabIndex = 0;
  @override
  void initState() {
    // Timer(new Duration(seconds: 5), () {
    //   setState(() {
    //     store.arrAll.add(new FileItem(
    //         phoneNumber: "123",
    //         nuName: "123",
    //         incoming: true,
    //         path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
    //         timeCall: 154,
    //         timeStamp: 1564061982));
    //   });
    // });
    tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
    audioPlugin = new AudioPlayer();
    // play();
  }

  // void play() async {
  //   await audioPlugin.play(
  //     "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  void openDrawer(context) {
    _key.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: MenuScreen(),
      body: Stack(
        children: <Widget>[
          Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/ic_bg_dark.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            color: Color(0xff63c2de),
            child: SafeArea(
              top: true,
              bottom: false,
              left: false,
              right: false,
              child: Column(
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ButtonOpacity(
                        onPressed: () {
                          // platform.invokeMethod("test");
                          // extract(true);
                          openDrawer(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, top: 8, bottom: 8, right: 20),
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            "assets/images/ic_menu.png",
                          ),
                        ),
                      ),
                      Text(
                        tabIndex == 0
                            ? "All Calls"
                            : tabIndex == 1
                                ? "Incomming calls"
                                : tabIndex == 2
                                    ? "Outgoing Calls"
                                    : "Favorite calls",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TabBar(
                          onTap: (idx) {
                            setState(() {
                              tabIndex = idx;
                            });
                          },
                          controller: tabController,
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              child: Image.asset(
                                tabIndex == 0
                                    ? "assets/images/all.png"
                                    : "assets/images/all2.png",
                                height: 30,
                              ),
                            ),
                            Tab(
                              child: Image.asset(
                                tabIndex == 1
                                    ? "assets/images/in.png"
                                    : "assets/images/in2.png",
                                height: 30,
                              ),
                            ),
                            Tab(
                              child: Image.asset(
                                tabIndex == 2
                                    ? "assets/images/out.png"
                                    : "assets/images/out2.png",
                                height: 30,
                              ),
                            ),
                            Tab(
                              child: Image.asset(
                                tabIndex == 3
                                    ? "assets/images/callStar.png"
                                    : "assets/images/callStar2.png",
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0Xfff0f3f5),
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Container(
                            child: Observer(
                              builder: (_) => ListView.builder(
                                itemCount: store.arrAll.length,
                                itemBuilder: (BuildContext ctxt, int index) =>
                                    getRow(context, store.arrAll[index]),
                              ),
                            ),
                          ),
                          Container(
                            child: Observer(
                              builder: (_) => ListView.builder(
                                itemCount: store.arrInComing.length,
                                itemBuilder: (BuildContext ctxt, int index) =>
                                    getRow(context, store.arrInComing[index]),
                              ),
                            ),
                          ),
                          Container(
                            child: Observer(
                              builder: (_) => ListView.builder(
                                itemCount: store.arrOutGoing.length,
                                itemBuilder: (BuildContext ctxt, int index) =>
                                    getRow(context, store.arrOutGoing[index]),
                              ),
                            ),
                          ),
                          Container(
                            child: Observer(
                              builder: (_) => ListView.builder(
                                itemCount: store.arrFavotite.length,
                                itemBuilder: (BuildContext ctxt, int index) =>
                                    getRow(context, store.arrFavotite[index]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 320,
          width: MediaQuery.of(context).size.width - 40,
          color: Colors.white,
          child: FlatButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            padding: EdgeInsets.all(0),
            onPressed: () {},
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 70,
                  color: Color(0xff63c2de),
                  child: FlatButton(
                    textColor: Colors.transparent,
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/user.png",
                              height: 60.0,
                              width: 60.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "Can't get name",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff2f353a)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/up.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      Text(
                                        "3:14 pm",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xffa39e9e)),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "00:06",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffa39e9e)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/addStart.png",
                        color: Colors.red,
                        height: 60.0,
                        width: 60.0,
                      ),
                      Text(
                        "add to library",
                        style:
                            TextStyle(color: Color(0xffa39e9e), fontSize: 15),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/addStart.png",
                        color: Colors.red,
                        height: 60.0,
                        width: 60.0,
                      ),
                      Text(
                        "add to library",
                        style:
                            TextStyle(color: Color(0xffa39e9e), fontSize: 15),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/addStart.png",
                        color: Colors.red,
                        height: 60.0,
                        width: 60.0,
                      ),
                      Text(
                        "add to library",
                        style:
                            TextStyle(color: Color(0xffa39e9e), fontSize: 15),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/addStart.png",
                        color: Colors.red,
                        height: 60.0,
                        width: 60.0,
                      ),
                      Text(
                        "add to library",
                        style:
                            TextStyle(color: Color(0xffa39e9e), fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ); // Call the Dialog.
}

Widget getRow(BuildContext context, FileItem item) {
  return Container(
    height: 80,
    margin: EdgeInsets.all(2),
    child: FlatButton(
      textColor: Colors.transparent,
      onPressed: () {
        store.playItem = item;
        Navigator.pushNamed(context, '/Player',
            arguments: <String, FileItem>{"item": item});
      },
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/images/user.png",
                height: 60.0,
                width: 60.0,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    item.nuName,
                    maxLines: 1,
                    style: TextStyle(fontSize: 16, color: Color(0xff2f353a)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          item.incoming
                              ? "assets/images/down.png"
                              : "assets/images/up.png",
                          height: 15,
                          width: 15,
                        ),
                        Text(
                          new DateFormat('dd/MM/yyyy   hh:mm').format(
                              new DateTime.fromMillisecondsSinceEpoch(
                                  item.timeStamp)),
                          style:
                              TextStyle(fontSize: 13, color: Color(0xffa39e9e)),
                        )
                      ],
                    ),
                    Text(
                      _printDuration(new Duration(seconds: item.timeCall)),
                      style: TextStyle(fontSize: 13, color: Color(0xffa39e9e)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 40,
            child: FlatButton(
              onPressed: () {
                _showAlert(context);
              },
              padding: EdgeInsets.all(0),
              child: Image.asset(
                "assets/images/more.png",
                height: 20,
                width: 20,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

String _printDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
