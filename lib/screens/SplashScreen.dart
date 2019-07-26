import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newcallrecorder/main.dart';
import 'package:newcallrecorder/modal/FileItem.dart';
import 'package:newcallrecorder/store/AppStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    init();
  }

  init() async {
    MyApp.prefs = await SharedPreferences.getInstance();
    getData();
  }

  void getData() async {
    List<FileItem> arr = [
      // new FileItem(
      //     phoneNumber: "0154756253",
      //     nuName: "Van Bo",
      //     incoming: true,
      //     path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
      //     timeCall: 60,
      //     timeStamp: 1564061982),
      // new FileItem(
      //     phoneNumber: "01927462728",
      //     nuName: "Van Nam",
      //     incoming: true,
      //     path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
      //     timeCall: 100,
      //     timeStamp: 1580061982),
      // new FileItem(
      //     phoneNumber: "0584562445",
      //     nuName: "Vu Truong",
      //     incoming: true,
      //     path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
      //     timeCall: 94,
      //     timeStamp: 1564091982),
      new FileItem(
          phoneNumber: "0365489654",
          nuName: "Vu Phung",
          incoming: false,
          path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
          timeCall: 40,
          timeStamp: 1564091982),
      new FileItem(
          phoneNumber: "0248756988",
          nuName: "Van Hunan",
          incoming: false,
          path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
          timeCall: 65,
          timeStamp: 1564091982),
    ];

    List<String> arrStr = new List<String>();
    arr.forEach((f) {
      arrStr.add(jsonEncode(f.toJson()));
    });
    MyApp.prefs.setStringList("out", arrStr);

    List<FileItem> arrAll = new List<FileItem>();
    List<FileItem> arrIn = new List<FileItem>();
    List<FileItem> arrOut = new List<FileItem>();
    List<FileItem> arrFavorite = new List<FileItem>();

    if (MyApp.prefs.getStringList("all") != null) {
      for (int i = 0; i < MyApp.prefs.getStringList("all").length; i++) {
        final f = MyApp.prefs.getStringList("all")[i];
        arrAll.add(FileItem.fromJson(jsonDecode(f)));
      }
    }

    if (MyApp.prefs.getStringList("in") != null) {
      for (int i = 0; i < MyApp.prefs.getStringList("in").length; i++) {
        final f = MyApp.prefs.getStringList("in")[i];
        arrIn.add(FileItem.fromJson(jsonDecode(f)));
      }
    }

    if (MyApp.prefs.getStringList("out") != null) {
      for (int i = 0; i < MyApp.prefs.getStringList("out").length; i++) {
        final f = MyApp.prefs.getStringList("out")[i];
        arrOut.add(FileItem.fromJson(jsonDecode(f)));
      }
    }

    if (MyApp.prefs.getStringList("favorite") != null) {
      for (int i = 0; i < MyApp.prefs.getStringList("favorite").length; i++) {
        final f = MyApp.prefs.getStringList("favorite")[i];
        arrFavorite.add(FileItem.fromJson(jsonDecode(f)));
      }
    }

    store.changeArrAll(arrAll);
    store.changearrFavorite(arrFavorite);
    store.changeArrInComing(arrIn);
    store.changeArrOutGoing(arrOut);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/block.jpg"),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: new Container(
          color: Color(0xff63c2de),
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset("assets/images/call.png"),
                new Container(
                  height: 70,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/MainScreen');
                    },
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Color(0xffffc107),
                        borderRadius: new BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      height: 60,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Start",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 70, bottom: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
