import 'package:exercicio_9/models/dog.response.dart';
import 'package:exercicio_9/network/api.dart';
import 'package:exercicio_9/ui/image.component.dart';
import 'package:flutter/material.dart';

class RandomComponent extends StatefulWidget {
  @override
  _RandomComponentState createState() => _RandomComponentState();
}

class _RandomComponentState extends State<RandomComponent> {
  DogResponse _dogResponse = DogResponse();

  @override
  void initState() {
    super.initState();
    _loadDog();
  }

  _loadDog() async {
    _dogResponse = await Api.retrieveDog();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (_dogResponse != null &&
            _dogResponse.message != null &&
            _dogResponse.message.isNotEmpty)
          ImageComponent(
            imagePath: _dogResponse.message,
          ),
      ],
    );
  }
}
