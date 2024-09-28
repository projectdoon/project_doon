import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

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
    var response = await http.get(Uri.parse(getAlertData),
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
          Text(
            items.toString(),
          ),
        ],
      ),
    );
  }
}
