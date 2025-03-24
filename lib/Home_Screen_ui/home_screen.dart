import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mydoon/Screens/AlertsListScreen.dart';
import '../config.dart';
import 'Category_Second_Row.dart';
import 'category_icons.dart';
import 'package:http/http.dart' as http;

List<Map<String, String>> userComplain = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.token});

  final token;

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
  late String fname;
  String? items;

  void getAlert() async {
    print('nononon');
    var response = await http.get(Uri.parse(getAlertData),
        headers: {"content-type": "application/json"});

    print('chal raha3');
    var jsonResponse = jsonDecode(response.body);
    print('chal raha4');
    print(jsonResponse['status']);
    items = jsonResponse[
        'tokendata']; //do not change the suggested content by android studio
    print(items);
    setState(() {});
  }

  void StartTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageControler.page == imagePaths.length - 1) {
        _pageControler.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        _pageControler.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("token print ho raha");
    print(widget.token);
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    fname = jwtDecodedToken['firstName'];
    _pages = List.generate(
        imagePaths.length,
        (index) => ImagePlaceholder(
              imagePath: imagePaths[index],
            ));
    StartTimer();
    getAlert();
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
          physics: const PageScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Welcome'),
                        ),
                        Text(
                          fname,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
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
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 2.5,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 2.5), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(top: 17),
                      width: 355,
                      height: MediaQuery.of(context).size.height / 5.5,
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
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: _activePage == index
                                          ? const Color.fromARGB(
                                              255, 58, 129, 241)
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
                padding: const EdgeInsets.only(left: 15, right: 25),
                height: 42,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(87, 119, 221, 119)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Garbage vehicle is on the way...',
                          style: TextStyle(fontSize: 12),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 7),
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/vehicleOTW2.png'),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print('button pressed');
                      },
                      child: const Text(
                        'Track Now',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, left: 18),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  textAlign: TextAlign.left,
                  'All services',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 5),
                child: CategoryIcons(token: widget.token),
              ),
              Container(
                margin: const EdgeInsets.only(top: 13, bottom: 13),
                child: const CategorySecondRow(),
              ),
              Image.asset('assets/Line 25.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8, left: 25),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      textAlign: TextAlign.left,
                      'Alerts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8, right: 20),
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Alertslistscreen(),
                          ),
                        );
                      },
                      child: const Text(
                        textAlign: TextAlign.left,
                        'View All',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 12, right: 18, left: 18, bottom: 41),
                height: 98,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  color: const Color.fromARGB(26, 255, 0, 0),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 8),
                      child: SvgPicture.asset('assets/Alert.svg'),
                    ),

                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          items.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                    // TextButton(onPressed: (){}, child: Text('view all'),)
                  ],
                ),
              ),
              Image.asset('assets/Line 25.png'),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                child: CategoryIcons(token: widget.token),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                child: CategoryIcons(token: widget.token),
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
                margin: const EdgeInsets.only(
                    top: 20, left: 17, right: 17, bottom: 10),
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
