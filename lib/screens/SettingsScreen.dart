import 'package:flutter/material.dart';

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
              style: TextStyle(fontSize: 40),
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
          ]),
    );
  }

  void setcolor(int color) {
    setState(() {
      settingColor = color;
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
