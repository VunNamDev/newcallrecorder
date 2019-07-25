import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  )
                ],
              ),
              Image.asset(
                "assets/images/call.png",
                height: 150,
                width: 100,
              ),
              Slider(
                activeColor: Colors.white,
                value: 0.5,
                onChanged: (double value) {},
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
                      FlatButton(
                        child: Image.asset(
                          "assets/images/play.png",
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
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
                  child: ListView(
                    children: <Widget>[
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow(),
                      getRow()
                    ],
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

Widget getRow() {
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
                    "Can't get name",
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
                          "3:14 pm",
                          style:
                              TextStyle(fontSize: 13, color: Color(0xffa39e9e)),
                        )
                      ],
                    ),
                    Text(
                      "00:06",
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
              onPressed: () {},
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
