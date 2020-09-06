import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {

  final String text;
  final Function onTap;

  const ListItem({ @required this.onTap, @required this.text});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { widget.onTap();},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(widget.text, textAlign: TextAlign.left,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),),
          ),
        ),
      ),
    );
  }
}
