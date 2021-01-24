import 'package:dyslexislash/fast.dart';
import 'package:dyslexislash/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7ccccc),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width / 1.2,
              child: FlatButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InitialScreen()))
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                color: Color(0xffB9FFA0),
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('assets/slow.png', height: 80, width: 80),
                      Text(
                        "slow",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff6DBA52),
                            fontSize: 37,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width / 1.2,
              child: FlatButton(
                onPressed: () => {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                color: Color(0xffFAFFC0),
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('assets/medium.png', height: 80, width: 80),
                      Text(
                        "medium",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xffFFC704),
                            fontSize: 37,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width / 1.2,
              child: FlatButton(
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Fast()))
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                color: Color(0xffF5CDCD),
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('assets/fast.png', height: 80, width: 80),
                      Text(
                        "fast",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xffFF8C8C),
                            fontSize: 37,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
