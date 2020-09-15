import 'package:exercicio7start/models/new.model.dart';
import 'package:exercicio7start/models/news.response.dart';
import 'package:exercicio7start/network/api.dart';
import 'package:exercicio7start/ui/news.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsResponse _newsResponse;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadNews();
  }

  _loadNews() async {
    if (_newsResponse == null) {
      _newsResponse = await Api.retrieveLocalNews(context);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_newsResponse == null) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0B1723),
          title: Text(
            'News',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Container(
          color: Color(0xFF101F30),
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 23),
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  New notice = this._newsResponse.news[index];
                  return News(
                    notice: notice,
                  );
                },
                itemCount: this._newsResponse.news.length,
              ),
            ),
          ),
        ));
  }
}
