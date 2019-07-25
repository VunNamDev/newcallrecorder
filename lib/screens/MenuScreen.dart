import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newcallrecorder/util/ButtonOpacity.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _showModalSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: 400,
            decoration: new BoxDecoration(
                color: Color(0xff63c2de),
                borderRadius: new BorderRadius.all(Radius.circular(5.0))),
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'This app support for extracting rar and zip file',
                    style: TextStyle(fontSize: 17, color: Color(0xff2f353a)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Swipe from left edge of screen or touch an icon in left corner to open the navigation panel. It include more option for you',
                    style: TextStyle(fontSize: 17, color: Color(0xff2f353a)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'You can choice dark back ground or light background on "Background style" option, depending on your preferences',
                    style: TextStyle(fontSize: 17, color: Color(0xff2f353a)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'To extract your file, navigate to the folder containing the file and select it, then wait for the dialog to disappear. At this time, the decompression process is complete.',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff2f353a),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {},
            child: new AlertDialog(
              title: new Text(
                'Your file will extract to',
                style: TextStyle(color: Color(0xff26a0f5), fontSize: 22.0),
              ),
              content: new Container(
                child: new Text(
                  '/storage/emulated/0/MySpecialFile',
                  style: TextStyle(color: Color(0xff2f353a), fontSize: 18.0),
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(
                    'Ok',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Color(0xff63c2de),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(
      //         "https://lh3.googleusercontent.com/9e8uYnzMOZcu99Ghv153iXRBPUH-w0vyvhCnIgcvyuF9_1mSyj8--9COGIfGN__5uLs=s180-rw"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "More option",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
            ButtonOpacity(
              onPressed: () {},
              onLongPress: () {},
              child: new Container(
                child: new Card(
                  child: Container(
                    color: Colors.transparent,
                    height: 60,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Background style",
                          style: TextStyle(
                            color: Color(0xff2f353a),
                            fontSize: 16.0,
                          ),
                        ),
                        Image.network(
                          "https://lh3.googleusercontent.com/9e8uYnzMOZcu99Ghv153iXRBPUH-w0vyvhCnIgcvyuF9_1mSyj8--9COGIfGN__5uLs=s180-rw",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                    offset: Offset(
                      -5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  ),
                ]),
              ),
            ),
            ButtonOpacity(
              onPressed: () {
                _showDialog(context);
              },
              onLongPress: () {},
              child: new Container(
                child: new Card(
                  child: Container(
                    color: Colors.transparent,
                    height: 60,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Storage folder",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Image.network(
                          "https://lh3.googleusercontent.com/9e8uYnzMOZcu99Ghv153iXRBPUH-w0vyvhCnIgcvyuF9_1mSyj8--9COGIfGN__5uLs=s180-rw",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                    offset: Offset(
                      -5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  ),
                ]),
              ),
            ),
            ButtonOpacity(
              onPressed: () {
                _showModalSheet();
              },
              onLongPress: () {},
              child: new Container(
                child: new Card(
                  child: Container(
                    color: Colors.transparent,
                    height: 60,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Instruction",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Image.network(
                          "https://lh3.googleusercontent.com/9e8uYnzMOZcu99Ghv153iXRBPUH-w0vyvhCnIgcvyuF9_1mSyj8--9COGIfGN__5uLs=s180-rw",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                    offset: Offset(
                      -5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  ),
                ]),
              ),
            ),
            ButtonOpacity(
              onPressed: () {},
              onLongPress: () {},
              child: new Container(
                child: new Card(
                  child: Container(
                    color: Colors.transparent,
                    height: 60,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Rate app",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Image.network(
                          "https://lh3.googleusercontent.com/9e8uYnzMOZcu99Ghv153iXRBPUH-w0vyvhCnIgcvyuF9_1mSyj8--9COGIfGN__5uLs=s180-rw",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                    offset: Offset(
                      -5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
