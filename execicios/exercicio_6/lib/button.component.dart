import 'package:exercicio_6/color.utils.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String label;
  Function action;
  int flex;
  Color textColor;
  Color backgroundColor;

  Button({
    this.label,
    this.action,
    this.flex = 1,
    this.textColor = Colors.white,
    this.backgroundColor = ColorUtils.defaultBackgroundButton,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  _setValue() {
      if (widget.action != null) {
        widget.action(widget.label);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: GestureDetector(
        onTap: () => _setValue(),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5,),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: widget.backgroundColor,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '${widget.label}',
                      style: TextStyle(color: widget.textColor, fontSize: 36),
                    ),
                  ),
                ),
                if(widget.flex > 1) Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
