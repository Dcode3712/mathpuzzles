import 'package:flutter/material.dart';
import 'package:mathpuzzles/Utils.dart';
import 'package:mathpuzzles/firstpage.dart';
import 'package:mathpuzzles/puzzlepage1.dart';
import 'package:mathpuzzles/secondpage.dart';

class puzzlepage extends StatefulWidget {
  int cnt;

  puzzlepage(this.cnt);

  @override
  State<puzzlepage> createState() => _puzzlepageState();
}

class _puzzlepageState extends State<puzzlepage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("myimages/background.jpg"),
                  fit: BoxFit.fill,
                )),
            child: Column(children: [
              Container(
                height: 50,
                width: 230,
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Text(
                  "Select Puzzle",
                  style: TextStyle(
                    // fontFamily: "family1",
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontStyle: FontStyle.italic,
                      fontSize: 33),
                ),
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: GridView.builder(
                      itemCount: 24,
                      itemBuilder: (context, index) {
                        int cnt = Utils.prefs!.getInt("cnt") ?? 0;

                        int status = Utils.prefs!.getInt("level$index") ?? 0;
                        // 0 : pending
                        // 1 : clear
                        // 2 : skip
                        if (status == 1) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return secondpage(index);
                                },
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Colors.black),
                                  image: DecorationImage(
                                    image: AssetImage("myimages/tick.png"),
                                    fit: BoxFit.fill,
                                  )),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                        else if (status == 2) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return secondpage(index);
                                },
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Colors.black)),
                              child: Text("${index + 1}",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          );
                        }
                        else {
                          if (index == cnt) {
                            return InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) {
                                      return secondpage(index);
                                    },
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(width: 1, color: Colors.black)),
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                        fontSize: 35, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                          } else {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("myimages/lock.png"),
                                    fit: BoxFit.fill,
                                  )),
                            );
                          }
                        }
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return puzzlepage1(widget.cnt);
                    },));
                  },
                  child: Container(
                    margin: EdgeInsets.all(22),
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: Image(
                      image: AssetImage("myimages/next.png"),
                      fit: BoxFit.fill,
                    ),
                  ))
            ]),
          ),
        )), onWillPop: goback);
  }
  Future<bool> goback()
  {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return firstpage();
      },));
      return Future.value();
  }
}
