import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fstec21_app/about_us.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'article.dart';
import 'article_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      accentColor: Colors.yellowAccent,
    );
    return MaterialApp(
      theme: theme,
      darkTheme: theme,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Article> articles;
  TextEditingController controller = TextEditingController();
  String filterText;

  @override
  void initState() {
    super.initState();
    controller.addListener(onSearchChanged);
    initStateAsync();
  }

  void onSearchChanged() {
    final text = controller.text.trim().toLowerCase();
    if (filterText == text) return;
    setState(
      () => filterText = text.isEmpty ? null : text,
    );
  }

  Future<void> initStateAsync() async {
    final articles = await loadArticles();
    setState(() => this.articles = articles);
  }

  Future<List<Article>> loadArticles() async {
    final articlesStr = await rootBundle.loadString('assets/database.json');
    final List<dynamic> articlesJson = jsonDecode(articlesStr);
    final articles = articlesJson.map((j) => Article.fromMap(j)).toList();
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    final articles = this
        .articles
        ?.where((a) => filterText == null
            ? true
            : a.name.toLowerCase().contains(filterText))
        ?.toList();
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ФСТЭК №21. УГРОЗЫ',
          style: TextStyle(
            color: Colors.yellowAccent,
          ),
        ),
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: const Icon(Icons.help_outline_rounded,
              size: 40, color: Colors.yellowAccent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AboutUsPage(),
              ),
            );
          },
          splashColor:
              Colors.yellowAccent.withOpacity(0.65772897348237498237492),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        constraints: BoxConstraints(
          maxWidth: 250,
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellowAccent, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellowAccent, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: 'Поиск...',
            hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.yellowAccent.shade200,
                ),
            isDense: true,
          ),
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.yellowAccent,
              ),
          cursorColor: Colors.yellowAccent,
        ),
      ),
      body: articles == null
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.yellowAccent)),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 75),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) =>
                              ArticlePage(article: articles[index])),
                    ),
                    splashColor: Colors.yellowAccent
                        .withOpacity(0.65772897348237498237492),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.grey[800],
                    child: Text(articles[index].name,
                        style: TextStyle(fontSize: 15)),
                  ),
                );
              },
              itemCount: articles.length,
            ),
    );
  }
}
