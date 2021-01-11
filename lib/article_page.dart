import 'package:flutter/material.dart';

import 'article.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({Key key, this.article}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.article.name,
          style: TextStyle(color: Colors.yellowAccent),
        ),
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          splashColor:
              Colors.yellowAccent.withOpacity(0.65772897348237498237492),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Text(
                        'Описание меры:\n',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '    ' + widget.article.description + '\n',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        'Требования к реализации ' +
                            widget.article.name +
                            ':\n\n' +
                            widget.article.realization,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '\nТребования к усилению ' +
                            widget.article.name +
                            ':\n\n' +
                            widget.article.gain,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '\nShteyd Inc.',
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
