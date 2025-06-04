import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:hugeicons/hugeicons.dart';
import 'package:mydoon/Providers/auth_provider.dart';

import '../configuration/config.dart';

class Alertslistscreen extends ConsumerStatefulWidget {
  const Alertslistscreen({super.key});

  @override
  ConsumerState<Alertslistscreen> createState() => _AlertslistscreenState();
}

class _AlertslistscreenState extends ConsumerState<Alertslistscreen> {
  List? items;
  late final String? token;

  void getAllAlerts() async {
    try {
      var response = await http.get(
        Uri.parse(Config.getAllAlertData),
        headers: {
          'Authorization': 'Bearer $token',
          "content-type": "application/json"
        },
      );
      var jsonResponse = jsonDecode(response.body);
      items = jsonResponse['success'];

      setState(() {});
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    token = ref.read(tokenProvider);
    getAllAlerts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const SizedBox(
              height: 10,
            ),
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
                              child: Text('No Alerts Available'),
                            ),
                          ) // Show loading indicator
                        : ListView.builder(
                            itemCount: items!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.white,
                                shadowColor:
                                    const Color.fromARGB(255, 255, 0, 0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  leading: HugeIcon(
                                    icon: HugeIcons.strokeRoundedAlert02,
                                    color: Colors.red,
                                  ),
                                  title: Text(
                                    items![index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: const Text(
                                    "Stay Safe!",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 199, 60, 60)),
                                  ),
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
