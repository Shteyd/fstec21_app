import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ИНФОРМАЦИЯ',
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
          )),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Align(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    children: [
                      TextSpan(text: '''
Угрозы отобраны по следующим критериям:

Тип угроз: 2 тип угрозы
Тип ИСПДн: Иная ИСПДн
Чьи данные обрабатываются: Не сотрудников этой организации
Количество субъектов ПДн: Более 100 000 человек
'''),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Shteyd Inc.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[800])),
            )
          ],
        ),
      ),
    );
  }
}
