import 'package:flutter/material.dart';
import 'package:mathpuzzles/puzzlepage.dart';
import 'package:mathpuzzles/secondpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  int? cnt;

  @override
  void initState() {

    super.initState();

    loadpref();
  }

  loadpref()
  async {
    Utils.prefs = await SharedPreferences.getInstance();

    cnt = Utils.prefs!.getInt("cnt") ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("myimages/background.jpg"),
                fit: BoxFit.fill)),
        child: Column(children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
                textAlign: TextAlign.center,
                "Math Puzzles",
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Container(
              // width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("myimages/blackboard_main_menu.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: OutlinedButton(
                          onPressed: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return secondpage(cnt!);
                            },));
                          },
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                              return puzzlepage(cnt!);
                            },));
                          },
                          child: Text(
                            "PUZZLES",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "BUY PRO",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                )),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(style: BorderStyle.solid),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black87,
                                    Colors.white,
                                    Colors.black87,
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image(image: AssetImage("myimages/shareus.png")),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(style: BorderStyle.solid),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black87,
                                    Colors.white,
                                    Colors.black87
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image(image: AssetImage("myimages/emailus.png")),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),
                          padding: EdgeInsets.all(3),
                          alignment: Alignment.center,
                          child: Text(
                            "Privacy Policy",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ))
            ]),
          ),
        ]),
      ),
    );
  }

}

