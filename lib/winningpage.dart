import 'package:flutter/material.dart';
import 'package:mathpuzzles/Utils.dart';
import 'package:mathpuzzles/firstpage.dart';
import 'package:mathpuzzles/secondpage.dart';

class winningpage extends StatefulWidget {
  int cnt;

  winningpage(this.cnt);

  @override
  State<winningpage> createState() => _winningpageState();
}

class _winningpageState extends State<winningpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("myimages/background.jpg"), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 100,
                //color: Colors.green,
                child: Text(
                  "Puzzle ${widget.cnt} Completed",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: "family2"),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 263,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 10),
                //color: Colors.greenAccent,
                child: Image.asset(
                  "myimages/trophy.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),

                child: InkWell(
                  onTap: () {
                    int cnt = Utils.prefs!.getInt("cnt") ?? 0;
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return secondpage(cnt);
                      },
                    ));
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    margin:
                    EdgeInsets.only(left: 5, top: 0, right: 20, bottom: 0),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.black12,
                              Colors.white,
                              Colors.black12
                            ]),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(style: BorderStyle.solid)),
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontFamily: "family2"),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return firstpage();
                      },
                    ));
                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    margin:
                    EdgeInsets.only(left: 5, top: 0, right: 20, bottom: 0),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.black12,
                              Colors.white,
                              Colors.black12
                            ]),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(style: BorderStyle.solid)),
                    child: Text(
                      "MAIN MENU",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontFamily: "family2"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 170,
                  margin:
                  EdgeInsets.only(left: 5, top: 0, right: 20, bottom: 0),
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black12,
                            Colors.white,
                            Colors.black12
                          ]),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(style: BorderStyle.solid)),
                  child: Text(
                    "BUY PRO",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontFamily: "family2"),
                  ),
                ),
              ),
              Container(
                height: 35,
                //color:Colors.redAccent,
                margin: EdgeInsets.only(top: 25,bottom: 0),
                child: Text(
                  "SHARE THIS PUZZLE",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                      fontFamily: "family2"
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blueGrey,
                            Colors.white,
                            Colors.blueGrey
                          ]),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(style: BorderStyle.solid)),
                  child: Image(image: AssetImage("myimages/shareus.png")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

