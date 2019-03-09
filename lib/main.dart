// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:fasdqweqe1233sd/list_act.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for material.AppBar.actions',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
      ),
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white70,
        body: Auth()
    );
  }
}

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthState();
}

class AuthState extends State<Auth> {

  Widget _getHeader() {
    return Expanded(
        flex: 3,
        child: Container(
            child: Icon(
              Icons.child_care,
              size: 64,
            ),
            color: Colors.greenAccent
        )
    );
  }

  TextEditingController titleControler = new TextEditingController();


  Widget _getAuthCenterWidgets() {
    return Expanded(
        flex: 4,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Card (
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Авторизация",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  TextField(
                    controller: titleControler,
                    decoration: InputDecoration(
                        labelText: 'Логин'
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                    ),
                    obscureText: true,
                  ),
                  Container(
                    height: 15,
                  ),
                  Container(
                      width: 400,
                      child: OutlineButton(onPressed: () async {
                        final response = await http.get('https://shadowapi.shadowsparky.ru/nikita.php?Nikita=' + titleControler.text);
                        print(response.body);
                        if (response.body == '"Eto nepravda, misha lox"') {
                          print('nepravda');
                          Navigator.of(context).push(
                            new MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return ListAct();
                              },
                            ),
                          );
                        }
                      },
                        child: Text("Авторизоваться"),
                      )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget _getBottom() {
    return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text("Забыли пароль?"),
            ),
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text("Нет аккаунта?"),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getHeader(),
            _getAuthCenterWidgets(),
            _getBottom()
          ],
        )
    );
  }

}