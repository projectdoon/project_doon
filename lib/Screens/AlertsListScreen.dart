import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class Alertslistscreen extends StatefulWidget {
  const Alertslistscreen({super.key});

  @override
  State<Alertslistscreen> createState() => _AlertslistscreenState();
}

class _AlertslistscreenState extends State<Alertslistscreen> {
  List? items;

  void getAllAlerts() async {
    print('initializing getting all alerts...');
    try {
      var response = await http.get(
        Uri.parse(getAllAlertData),
        headers: {"content-type": "application/json"},
      );
      print('chala2 in my complain');
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      print('chala3 in my complain');
      print(jsonResponse['status']);
      items = jsonResponse['success'];
      print(items);

      setState(() {});
    } catch (err) {
      print(err);
    }
  }

  void initState() {
    getAllAlerts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  const Expanded(
                    child: Text(
                      'All Alerts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: items == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : items!.isEmpty
                        ? const Center(
                            child: Center(
                              child: Text('No Alerts Availaible'),
                            ),
                          ) // Show loading indicator
                        : ListView.builder(
                            itemCount: items!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                shadowColor: Colors.red,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.error_outline_rounded,
                                      color: Colors.red),
                                  title: Text(
                                    items![index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: const Text("Stay Safe!",style: TextStyle(color: Color.fromARGB(
                                      255, 199, 60, 60)),),
                                ),
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
