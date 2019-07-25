import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:newcallrecorder/modal/FileItem.dart';
import 'package:newcallrecorder/store/AppStore.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer audioPlugin;
  bool isPlay = false;

  double value = 0.0;

  @override
  void initState() {
    super.initState();
    audioPlugin = new AudioPlayer();
    setUpAudio();
  }

  void setUpAudio() {
    audioPlugin.onAudioPositionChanged.listen((onData) {
      // print(onData.inSeconds / store.playItem.timeCall);
      setState(() {
        this.value = onData.inSeconds / store.playItem.timeCall;
      });
      audioPlugin.onPlayerCompletion.listen((onData) {
        setState(() {
          this.value = 0;
          isPlay = false;
        });
      });
      audioPlugin.onPlayerError.listen((onData) {
        setState(() {
          this.value = 0;
          isPlay = false;
        });
      });
    });
  }

  @override
  void dispose() {
    audioPlugin.stop();
    super.dispose();
  }

  void play() async {
    await audioPlugin.play(store.playItem.path,
        position:
            new Duration(seconds: (value * store.playItem.timeCall).round()));
    setState(() {
      isPlay = true;
    });
  }

  void forward(Duration duration) async {
    await audioPlugin.stop();
    await audioPlugin.play(store.playItem.path, position: duration);
    setState(() {
      isPlay = true;
    });
  }

  void stop() async {
    await audioPlugin.stop();
    setState(() {
      isPlay = false;
    });
  }

  void onChangeSlideEnd(double postion) {
    forward(new Duration(seconds: (postion * store.playItem.timeCall).round()));

    print(postion);

    // forward()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff63c2de),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(right: 5, left: 5),
                    width: 50,
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        "assets/images/back.png",
                        height: 30,
                        width: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    store.playItem.nuName,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
              Image.asset(
                "assets/images/call.png",
                height: 100,
                width: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _printDuration(new Duration(
                            seconds: (this.value * store.playItem.timeCall)
                                .round())) +
                        " / ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      _printDuration(
                          new Duration(seconds: store.playItem.timeCall)),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Slider(
                  activeColor: Colors.white,
                  value: value,
                  onChangeEnd: (double value) {
                    onChangeSlideEnd(value);
                  },
                  onChanged: (double value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
              ),
              // Text("01694744534"),
              new Container(
                color: Color(0Xfff0f3f5),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Color(0xff63c2de),
                      borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: const Radius.circular(25.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Image.asset(
                          "assets/images/previous.png",
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                      isPlay
                          ? FlatButton(
                              child: Image.asset(
                                "assets/images/pause.png",
                                height: 40,
                                width: 40,
                              ),
                              onPressed: () {
                                stop();
                              },
                            )
                          : FlatButton(
                              child: Image.asset(
                                "assets/images/play.png",
                                height: 40,
                                width: 40,
                              ),
                              onPressed: () {
                                play();
                              },
                            ),
                      FlatButton(
                        child: Image.asset(
                          "assets/images/next.png",
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Image.asset(
                          "assets/images/star.png",
                          height: 27,
                          width: 27,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.only(top: 10),
                  color: Color(0Xfff0f3f5),
                  child: Observer(
                    builder: (_) => ListView.builder(
                      itemCount: store.arrOutGoing.length,
                      itemBuilder: (BuildContext ctxt, int index) =>
                          getRow(context, store.arrOutGoing[index]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getRow(BuildContext context, FileItem item) {
  return Container(
    height: 80,
    margin: EdgeInsets.all(2),
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
                          "assets/images/up.png",
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
