import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User.dart';
import 'Services.dart';


class JsonParseDemo extends StatefulWidget {
  JsonParseDemo() :super();

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {

  List<User> _users;
  bool _loading;

  @override
  void initState(){
    super.initState();
    _loading = true;
    Services.getUsers().then((users){
      _users = users;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...': 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index){
              User user = _users[index];
              return ListTile(
                title: Text(user.name),
                subtitle:Text(user.email),
              );
        }),
      ),
    );
  }
}
