import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'configuration/config.dart';

class test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _testState();
  }
}

class _testState extends State<test> {
  @override
  void initState() {
    getAlert();
    super.initState();
  }

  String? items;
  void getAlert() async {
    print('nononon');
    var response = await http.get(Uri.parse(Config.getAlertData),
        headers: {"content-type": "application/json"});

    print('chal raha3');
    var jsonResponse = jsonDecode(response.body);
    print('chal raha4');
    print(jsonResponse['status']);
    items = jsonResponse['tokendata'];
    print(items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/mydoonapp-4ccea.appspot.com/o/images%2F1728667785175?alt=media&token=7a34c9cc-f24c-4f65-90ff-3181177f35b8',
          ),
        ],
      ),
    );
  }
}
