import 'package:flutter/material.dart';

import 'card_container.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            )
          ],
          title: Row(
            children: [
              Text('Postcard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              CardContainer(
                roundedColor: Color(0xFFFC3875),
                icon: Icons.person,
                title: 'Recipient',
                description: 'Amelie N Mason',
              ),
              SizedBox(
                height: 30,
              ),
              CardContainer(
                roundedColor: Color(0xFFFCAB55),
                icon: Icons.business,
                title: 'Address',
                description:
                    '47 Greyfriars Road, CAPHEATON \nUnited Kindom \nNE19 5PJ',
              ),
              SizedBox(
                height: 30,
              ),
              CardContainer(
                roundedColor: Color(0xFF22C0FC),
                icon: Icons.edit,
                title: 'Message',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin diam tortor, varius ut rutrum ut, congue vel lacus. Suspendisse enim elit, luctus non ultrices mattis, vehicula semper orci. In quis ante placerat, semper tellus ut, malesuada velit. Nam id sollicitudin lorem, vel efficitur metus. Praesent viverra elit mauris, vel porttitor orci vestibulum suscipit. Aenean in ultricies velit. Aenean eu dolor enim. Integer vel neque ut urna luctus interdum.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FlatButton(
                color: Color(0xFF767676),
                textColor: Colors.white,
                padding: EdgeInsets.all(13),
                onPressed: () {},
                child: Text(
                  'SAVE DRAFT',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: FlatButton(
                color: Color(0xFFFC3875),
                textColor: Colors.white,
                padding: EdgeInsets.all(13),
                onPressed: () {},
                child: Text(
                  'REVIEW DESIGN',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
