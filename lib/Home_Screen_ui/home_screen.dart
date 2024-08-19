import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Category_Second_Row.dart';
import 'category_icons.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

final List<String> imagePaths = [
  'assets/image1.jpeg',
  'assets/image2.jpeg',
  'assets/image3.jpeg',
];

late List<Widget> _pages;

int _activePage = 0;

final PageController _pageControler = PageController(initialPage: 0);
Timer? _timer;

class _HomeScreenState extends State<HomeScreen> {
  void StartTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageControler.page == imagePaths.length - 1) {
        _pageControler.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageControler.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
        imagePaths.length,
        (index) => ImagePlaceholder(
              imagePath: imagePaths[index],
            ));
    StartTimer();
  }

  @override
  Widget build(context) {




    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(15),
      //     child: AppBar(
      //       backgroundColor: Colors.white,
      //     )),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Welcome'),
                        ),
                        Text(
                          'Adhiraj',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          iconSize: 27,
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          iconSize: 27,
                          icon: const Icon(Icons.notifications_on_outlined),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],),
                      margin: EdgeInsets.only(top: 17),
                      width: 360,
                      height: MediaQuery.of(context).size.height / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: PageView.builder(
                          controller: _pageControler,
                          itemCount: imagePaths.length,
                          itemBuilder: (context, index) {
                            return _pages[index];
                          },
                          onPageChanged: (value) {
                            setState(() {
                              _activePage = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  //code for page indicator
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            _pages.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      _pageControler.animateToPage(index,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: _activePage == index
                                          ? Color.fromARGB(255, 58, 129, 241)
                                          : Colors.grey,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  textAlign: TextAlign.left,
                  'All services',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18, bottom: 5),
                child: const CategoryIcons(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: const CategorySecondRow(),
              ),
              Image.asset('assets/Line 25.png'),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  textAlign: TextAlign.left,
                  'Alerts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 15, right: 18, left: 18, bottom: 41),
                height: 100,
                decoration: BoxDecoration(

                    color: Color.fromARGB(26, 255, 0, 0),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Image.asset('assets/Line 25.png'),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                child: const CategoryIcons(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                child: const CategoryIcons(),
              ),
              Image.asset('assets/Line 25.png'),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  textAlign: TextAlign.left,
                  'Feedback',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              Container(
                height: 45,
               margin: const EdgeInsets.only(top: 20,left: 17,right: 17,bottom: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    autofocus: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 130, 130, 130),
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                      hintText: 'Feedback',
                      border: InputBorder.none,
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
//----------------------------ads section--------------------------//
class ImagePlaceholder extends StatelessWidget {
  final String? imagePath;

  const ImagePlaceholder({super.key, this.imagePath});
  @override
  Widget build(context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.fill,
    );
  }
}


