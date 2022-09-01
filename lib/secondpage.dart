// import 'dart:ffi';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzles/firstpage.dart';
import 'package:mathpuzzles/winningpage.dart';

import 'Utils.dart';

class secondpage extends StatefulWidget {
  int cnt;

  secondpage(this.cnt);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  int cnt = 0;

  String box = "";
  List<String> level = [];
  List<String> anserlist = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50",
  ];

  @override
  void initState() {
    super.initState();
    cnt = widget.cnt;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("myimages/gameplaybackground.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin:
                        EdgeInsets.only(top: 35, bottom: 5, right: 2, left: 2),
                    child: Row(children: [
                      InkWell(
                        onTap: () async {
                          int status = Utils.prefs!.getInt("level$cnt") ?? 0;

                          if (status == 0) {
                            await Utils.prefs!.setInt('level$cnt', 2);
                            cnt++;
                            await Utils.prefs!.setInt('cnt', cnt);

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return secondpage(cnt);
                              },
                            ));
                          } else if (status == 1 || status == 2) {
                            int cnt = Utils.prefs!.getInt('cnt') ?? 0;
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return secondpage(cnt);
                              },
                            ));
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(left: 7, right: 7),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("myimages/skip.png"),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 200,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("myimages/level_board.png"),
                                fit: BoxFit.fill)),
                        child: Text(
                          "Puzzle ${cnt + 1}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(left: 7, right: 7),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("myimages/hint.png"),
                                  fit: BoxFit.fill)),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 260),
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("myimages/p${cnt + 1}.png"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    color: Colors.black,
                    height: 120,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 205,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    "$box",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  if (box.isNotEmpty) {
                                    setState(() {
                                      box = box.substring(0, box.length - 1);
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  margin: EdgeInsets.only(top: 3, bottom: 3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "myimages/delete.png",
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 98,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(0),
                                color: Colors.white10,
                                child: OutlinedButton(
                                  onPressed: () async {
                                    if (box == anserlist[cnt]) {
                                      if (cnt < anserlist.length - 1) {
                                        int status = Utils.prefs!.getInt("level$cnt") ?? 0;
                                        if (status == 0) {
                                          await Utils.prefs!
                                              .setInt('level$cnt', 1);
                                          cnt++;
                                          await Utils.prefs!.setInt('cnt', cnt);
                                          Navigator.pushReplacement(context,
                                              PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return winningpage(cnt);
                                            },
                                          ));
                                        } else if (status == 1) {
                                          cnt++;
                                          Navigator.pushReplacement(context,
                                              PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return winningpage(cnt);
                                            },
                                          ));
                                        } else if (status == 2) {
                                          await Utils.prefs!
                                              .setInt('level$cnt', 1);
                                          cnt++;
                                          Navigator.pushReplacement(context,
                                              PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return winningpage(cnt);
                                            },
                                          ));
                                        }
                                      }
                                      // box = "";
                                    } else {
                                      box = "";
                                      Fluttertoast.showToast(
                                          msg: "Wrong!!!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 2,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  },
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),

                                    // textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          )),
                          Container(
                            height: 40,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              children: allbtn(),
                            ),
                          ),
                        ]),
                  ),
                ],
              )),
          // Container(color: Colors.black,height: 150,)
        ),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
    return Future.value();
  }

  List<Widget> allbtn() {
    List<Widget> l = [];
    for (int i = 0; i < 10; i++) {
      l.add(Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              box = "$box$i";
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white12,
                border: Border.all(color: Colors.white, width: 1)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(4),
            child: Text(
              "$i",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ));
    }
    return l;
  }
}
