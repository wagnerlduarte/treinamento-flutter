import 'package:exercicio_11/loader.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Widget _tabContent(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text('Rolês (Pós-Quarentena)'),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: GestureDetector(
                child: Icon(Icons.camera_alt),
                onTap: () => {
                  Navigator.pushNamed(context, '/camera')
                },
              ),
            ),
            Tab(
              text: 'RECENTES',
            ),
            Tab(
              text: 'CONTATOS',
            )
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Container(
            child: Loader(),
          ),
          Container(
              child:
                  Center(child: Text('Você não possui rolês cadastrados :('))),
          Container(
              child: Center(child: Text('Sua lista de contatos está vazia :(')))
        ],
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _tabContent(context);
  }
}
