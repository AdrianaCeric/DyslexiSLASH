import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Wave.png',
                  ),
                  Container(
                    color: Color(0xffD8EFEF),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon:
                            Icon(Icons.mail_outline, color: Color(0xff5CA6A6)),
                        labelText: "Enter your Email",
                        fillColor: Color(0xffD8EFEF),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xffD8EFEF),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon:
                            Icon(Icons.lock_open, color: Color(0xff5CA6A6)),
                        labelText: "Enter your Password",
                        fillColor: Color(0xffD8EFEF),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.check_circle,
                    ),
                    iconSize: 100,
                    color: Color(0xffD8EFEF),
                    onPressed: () {},
                  ),
                  // Container(
                  //   height: 45,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: RaisedButton(
                  //     child: Text(
                  //       'LOG IN',
                  //       style:
                  //           TextStyle(color: Color(0xff6202ee), fontSize: 15),
                  //     ),
                  //     color: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(28),
                  //         side: BorderSide(color: Color(0xff6202ee))),
                  //     onPressed: () {
                  //       // LOGIN write code here
                  //       //  Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //       builder: (context) => LogIn(),
                  //       //     ),
                  //       //   );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
