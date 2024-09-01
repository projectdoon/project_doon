import 'package:flutter/material.dart';

import 'isRegister.dart';

class complainExpanded extends StatefulWidget {
  const complainExpanded({super.key});

  @override
  State<complainExpanded> createState() => _allComplainState();
}

class _allComplainState extends State<complainExpanded> {
  List<String> itemsofComplain = [
    "Garbage Collection",
    "Dead Animal",
    "Water Leakage"
  ];
  String? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [


              Container(
                margin: const EdgeInsets.only(top: 48),
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
                        'Complain',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.02), // Equal spacing on the right
                  ],
                ),
              ),

              const SizedBox(height: 95,),

              DropdownButton<String>(
                padding: const EdgeInsets.only(left: 30, right: 30),
                value: index,
                hint: const Text(
                  'Type of Complain!',
                  style: TextStyle(
                    fontFamily: 'FontMain/Product Sans Bold.ttf',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.black,
                ),
                underline: SizedBox(),
                items: itemsofComplain.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      'Category: ' + value,
                      style: const TextStyle(
                        fontFamily: 'FontMain/Product Sans Bold.ttf',
                        fontSize: 15,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
              ),

              const SizedBox(height: 30),

              Container(
                width: 450,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Add a Comment:',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                      elevation: 2.0, // Button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Button padding
                    ),
                    onPressed: () async {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Upload A Picture',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16, // Text size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // speak to complain
              Container(
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                      elevation: 2.0, // Button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Button padding
                    ),
                    onPressed: () async {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Speak To Conplain',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16, // Text size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 55),

              Container(
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                      elevation: 2.0, // Button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Button padding
                    ),
                    onPressed: () async {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Isregister()),
                        );

                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register A complain',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16, // Text size
                          ),
                        ),
                      ],
                    ),
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
