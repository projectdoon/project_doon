import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mydoon/Providers/auth_provider.dart';
import '../User Profile/profileSection.dart';
import 'Services_screen.dart';
import 'home_screen.dart';

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {
  late final String? token;
  late NavigationController controller;

  @override
  void initState() {
    super.initState();
    token = ref.read(tokenProvider);
    controller = Get.put(NavigationController(tokendata: token));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const UserProfile(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          height: 80,
          shadowColor: Colors.black,
          elevation: 15,
          selectedIndex: controller.selectedIndex.value,
          indicatorColor: const Color.fromARGB(76, 58, 129, 241),
          onDestinationSelected: (index) {
            if (index == 3) {
              _scaffoldKey.currentState?.openEndDrawer();
            } else {
              controller.selectedIndex.value = index;
            }
          },
          destinations: [
            NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome03,
                  color: Colors.black,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedDashboardSquareAdd,
                  color: Colors.black,
                ),
                label: 'Services'),
            NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHeadphones,
                  color: Colors.black,
                ),
                label: 'Contact Us'),
            NavigationDestination(
                icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedAccountSetting02,
                    color: Colors.black),
                label: 'My Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
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
          const SizedBox(height: 8.0),
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
  final PageController pageController = PageController();
  NavigationController({this.tokendata});
  final tokendata;

  final Rx<int> selectedIndex = 0.obs;
  late final screens = [
    const HomeScreen(),
    const ServicesScreen(),
    const UserProfile(),
    const UserProfile(),
  ];
}
