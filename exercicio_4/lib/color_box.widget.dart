import 'package:flutter/material.dart';

import 'color_utils.dart';

class ColorBox extends StatefulWidget {
  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  Color color1 = Colors.red;
  TextEditingController color1Controller;

  @override
  void initState() {
    super.initState();
    color1Controller = TextEditingController(text: ColorUtils.toHex(color1));
  }

  @override
  void didUpdateWidget(ColorBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      color1 = ColorUtils.fromHex(color1Controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: color1,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              maxLength: 9,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              controller: color1Controller,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}
