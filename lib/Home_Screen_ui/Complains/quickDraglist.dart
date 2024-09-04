import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydoon/Home_Screen_ui/Complains/quicDragIsregister.dart';

import '../home_screen.dart';

class DragList extends StatefulWidget {
  const DragList({super.key});

  @override
  State<DragList> createState() => _DragListState();
}

class _DragListState extends State<DragList> {

  List<String> itemsofComplain = ["Garbage Collection", "Dead Animal", "Water Leakage"];
  String? index;

  @override
  Widget build(BuildContext context) {

    void addToUserComplain() {
      print('added succesfully');
      userComplain.add({"message": "You Registered a complain",});
      Navigator.pop(context);
    }


    double displaySize = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 0.85,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    width: 85,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

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
                        style: TextStyle(
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

                const SizedBox(height: 25),

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

                const SizedBox(height: 25),



                Row(

                  children: [

                    Container(
                      width: displaySize * 0.45,
                      height: 150,
                      padding: const EdgeInsets.only(left: 15,),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0), // Rounded corners
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(top:20,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.upload,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Upload an Image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12, // Text size
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 16),

                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text(
                              //     'One Click Register! ',
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 10, // Text size
                              //     ),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 16),

                    Container(
                      width: displaySize * 0.42,
                      height: 150,
                      padding: const EdgeInsets.only(right: 5,),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                          elevation: 2.0, // Button shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0), // Rounded corners
                          ),
                        ),
                        onPressed: () {  },
                        child: Padding(
                          padding: EdgeInsets.only(top:20,),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.mic,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Press and Hold',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12, // Text size
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 16),

                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text(
                              //     'One Click Register! ',
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 10, // Text size
                              //     ),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ],

                ),


                // const SizedBox(height: 35),

                //     Container(
            //   width: 450,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 30, right: 30),
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromARGB(255, 24, 118, 210),
            //         elevation: 2.0, // Button shadow
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0), // Rounded corners
            //         ),
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 20, vertical: 12), // Button padding
            //       ),
            //       onPressed: () async {
            //
            //       },
            //       child: const Row(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.upload_rounded,
            //             color: Colors.white,
            //           ),
            //           SizedBox(width: 8),
            //           Text(
            //             'Upload A Picture',
            //             style: TextStyle(
            //               color: Colors.white, // Text color
            //               fontSize: 16, // Text size
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),


                // const SizedBox(height: 35),
                //
                // // speak to complain
                // Container(
                //   width: 450,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 30, right: 30),
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                //         elevation: 2.0, // Button shadow
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10.0), // Rounded corners
                //         ),
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 20, vertical: 12), // Button padding
                //       ),
                //       onPressed: () async {
                //
                //       },
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: const [
                //           Icon(
                //             Icons.mic,
                //             color: Colors.white,
                //           ),
                //           SizedBox(width: 8),
                //           Text(
                //             'Speak To Conplain',
                //             style: TextStyle(
                //               color: Colors.white, // Text color
                //               fontSize: 16, // Text size
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //

                const SizedBox(height: 35),

                Container(
                  width: 450,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                        elevation: 2.0, // Button shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12), // Button padding
                      ),
                      onPressed: ()  {

                        addToUserComplain();

                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return Quick_DragIsRegister(); // Replace with your new drag list widget
                          },
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Register a complain',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16, // Text size
                              fontWeight: FontWeight.bold,
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
        );
      },
    );
  }
}

