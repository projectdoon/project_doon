import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../User Profile/MyComplain.dart';
import '../User Profile/drawerItems.dart';
import '../User Profile/profileSection.dart';
import '../start_screen.dart';
import 'Services_screen.dart';
import 'home_screen.dart';

class NavigationMenu extends StatefulWidget {
  NavigationMenu({super.key, this.token});
  final token;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove token from storage
    print("User logged out successfully.");

    // Navigate to the login or start screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(tokendata: widget.token));

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        width: screenWidth * 0.72,
        child: Drawer(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 80, 12, 0),
              child: Column(
                children: [
                  headerWidget(),
                  const SizedBox(height: 45),
                  drwaerItems(
                    name: 'Home',
                    icon: Icons.home,
                    onPressed: () => onPressFunction(context, index: 0),
                  ),
                  const SizedBox(height: 25),
                  drwaerItems(
                    name: 'My Complains',
                    icon: Icons.settings,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => myComplain(
                                  token: widget.token,
                                ))),
                  ),
                  const SizedBox(height: 25),
                  drwaerItems(
                    name: 'My Bills ',
                    icon: Icons.settings,
                    onPressed: () => onPressFunction(context, index: 2),
                  ),
                  const SizedBox(height: 25),
                  drwaerItems(
                    name: 'My Pet',
                    icon: Icons.settings,
                    onPressed: () => onPressFunction(context, index: 3),
                  ),
                  const SizedBox(height: 25),
                  drwaerItems(
                    name: 'My Challan',
                    icon: Icons.settings,
                    onPressed: () => onPressFunction(context, index: 4),
                  ),
                  const SizedBox(height: 110),
                  Container(
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            225, 255, 0, 0), // Button color
                        elevation: 5.0, // Button shadow
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12), // Button padding
                      ),
                      onPressed: (){logout(context);},
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16, // Text size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          height: 80,
          shadowColor: Colors.black,
          elevation: 15,
          selectedIndex: controller.selectedIndex.value,
          indicatorColor: Color.fromARGB(76, 58, 129, 241),
          onDestinationSelected: (index) {
            if (index == 3) {
              _scaffoldKey.currentState?.openEndDrawer();
            } else {
              controller.selectedIndex.value = index;
            }
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.apps), label: 'Services'),
            NavigationDestination(
                icon: Icon(Icons.headphones), label: 'Contact Us'),
            NavigationDestination(
                icon: Icon(Icons.account_circle_outlined), label: 'My Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  void onPressFunction(BuildContext context, {required int index}) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        break;

      case 1:
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => myComplain(
                      token: widget.token,
                    )));
        break;
    }
  }

  Widget headerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Welcome User',
            style: TextStyle(
              fontFamily: 'FontMain/Product Sans Bold.ttf',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'FontMain/Product Sans Bold.ttf',
                fontSize: 20,
                color: Color.fromARGB(225, 24, 118, 210),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  NavigationController({this.tokendata});
  final tokendata;

  final Rx<int> selectedIndex = 0.obs;
  late final screens = [
    HomeScreen(
      token: tokendata,
    ),
    ServicesScreen(),
    UserProfile(token: tokendata,),
    UserProfile(token: tokendata,)
  ];
}
