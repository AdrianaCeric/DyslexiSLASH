import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'canvas_area_fast/canvas_area_fast.dart';

class Fast extends StatefulWidget {
  @override
  _FastState createState() => _FastState();
}

class _FastState extends State<Fast> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            Scaffold(backgroundColor: Colors.black54, body: CanvasAreaFast()));
  }
}
