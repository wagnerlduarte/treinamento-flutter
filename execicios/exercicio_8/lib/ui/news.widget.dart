import 'package:exercicio7start/models/new.model.dart';
import 'package:exercicio7start/ui/category.widget.dart';
import 'package:exercicio7start/ui/detail.page.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  final New notice;

  const News({Key key, @required this.notice}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/detail',
            arguments: DetailPageArguments(widget.notice))
      },
      child: Padding(
        padding: EdgeInsets.only(top: 18),
        child: Container(
          color: Color(0xFF595151),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 190),
                      child: Image.network(
                        widget.notice.image,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent loadingProgress,
                        ) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object e,
                            StackTrace stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: this
                                  .widget
                                  .notice
                                  .category
                                  .map<Widget>((category) {
                                return Category(label: category);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                //Image.network(widget.notice.image),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    widget.notice.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 11,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    widget.notice.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
