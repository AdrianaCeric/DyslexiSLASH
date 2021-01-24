import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff7ccccc),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Clap.png',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You scored",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff5CA6A6),
                          fontSize: 37,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "10 points",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xffD8EFEF),
                          fontSize: 37,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/Play.png')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
