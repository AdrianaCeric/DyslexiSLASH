import 'package:dyslexislash/initial_screen.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:dyslexislash/screens/level.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final Config config = Config(
    tenant: 'f5e8d153-117b-4e4a-b90c-444a852abf97',
    clientId: 'd7464976-8865-49fc-a5c8-7c4ee51b033f',
    scope: 'openid profile offline_access',
    redirectUri: 'https://login.live.com/oauth20_desktop.srf',
  );
  final AadOAuth oauth = AadOAuth(config);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var rectSize =
        Rect.fromLTWH(0.0, 25.0, screenSize.width, screenSize.height - 25);
    oauth.setWebViewScreenSize(rectSize);

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
                      'assets/Wave.png',
                    ),
                    Container(
                      height: 58,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: RaisedButton(
                          color: Color(0xffD8EFEF),
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff5CA6A6),
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          onPressed: () {
                            login();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      FlatButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Levels()));
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login() async {
    try {
      await oauth.login();
      var accessToken = await oauth.getAccessToken();
      showMessage('Logged in successfully');
    } catch (e) {
      showError(e);
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage('Logged out');
  }
}
