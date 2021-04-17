import 'package:flutter/material.dart';
import 'package:globapp/data/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int settingColor = 0xff1972d2;
  double fontsize = 16;
  List<int> colors = [
    0xff0000d2,
    0xff00ffd2,
    0xff3875d2,
    0xffd700d2,
    0xff0082d2
  ];
  SPSettings settings;

  @override
  void initState() {
    settings = SPSettings();
    settings.init().then((value) {
      setState(() {
        settingColor = settings.getColor();
        fontsize = settings.getfont();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(settingColor),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Choose Color",
              style: TextStyle(fontSize: fontsize),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => setcolor(colors[0]),
                  child: ColorSquare(colors[0]),
                ),
                GestureDetector(
                  onTap: () => setcolor(colors[1]),
                  child: ColorSquare(colors[1]),
                ),
                GestureDetector(
                  onTap: () => setcolor(colors[2]),
                  child: ColorSquare(colors[2]),
                ),
                GestureDetector(
                  onTap: () => setcolor(colors[3]),
                  child: ColorSquare(colors[3]),
                ),
                GestureDetector(
                  onTap: () => setcolor(colors[4]),
                  child: ColorSquare(colors[4]),
                ),
              ],
            ),
            Text("Choose Font Size"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => setfontSize(10),
                  child: Text("very small"),
                ),
                GestureDetector(
                  onTap: () => setfontSize(16),
                  child: Text("small"),
                ),
                GestureDetector(
                  onTap: () => setfontSize(30),
                  child: Text("medium"),
                ),
                GestureDetector(
                  onTap: () => setfontSize(40),
                  child: Text("large"),
                ),
                GestureDetector(
                  onTap: () => setfontSize(50),
                  child: Text("very large"),
                ),
              ],
            ),
          ]),
    );
  }

  void setfontSize(double fontSize) {
    setState(() {
      fontsize = fontSize;
      settings.setfont(fontSize);
    });
  }

  void setcolor(int color) {
    setState(() {
      settingColor = color;
      settings.setColor(color);
    });
  }
}

//ColorSquare template
class ColorSquare extends StatelessWidget {
  final int colorcode;
  ColorSquare(this.colorcode);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(colorcode),
      ),
    );
  }
}
