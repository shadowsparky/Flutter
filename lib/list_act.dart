import 'package:fasdqweqe1233sd/RestPodo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListAct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListActState();
  }
}

class ListActState extends State<ListAct> {
  int page = 1;
  List<ResultObject> _content = [];
  ScrollController _controller;

  Future<ResultObject> getData() async {
    final result = await http.get('https://reqres.in/api/users?page=' + page.toString());
    var parsed = ResultObject.parse(jsonDecode(result.body));
    print(parsed.data.length);
    setState(() {
      _content.add(parsed);
    });
    page++;
  }

  ListActState() {
    for (int i = 0; i < 15; i++) {
      getData();
    }
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    print(_controller.offset.toString() + " " + _controller.position.maxScrollExtent.toString());
    if (_controller.offset == _controller.position.maxScrollExtent) {
      print('Надо бы загрузить еще данных...');
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        title: const Text('Dummy List Example'),
      ),
      body: ListView.builder(
        itemCount: _content.length,
        controller: _controller,
        itemBuilder: (context, index) {
          return _buildRow(_content[index]);
        },
      ),
    );
  }

  Widget _buildRow(ResultObject obj) {
    return ListTile(
      title: Text(
        obj.page.toString()
      ),
      trailing: new Icon(
          Icons.favorite_border
      ),
      onTap: () {
        setState(() {
          print(obj.page.toString() + " clicked");
        });
      },
    );
  }

}