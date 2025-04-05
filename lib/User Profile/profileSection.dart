import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mydoon/Providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../start_screen.dart';
import 'MyComplain.dart';
import 'drawerItems.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  ConsumerState<UserProfile> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends ConsumerState<UserProfile> {
  late final String? token;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    token = ref.read(tokenProvider);

    Future.delayed(Duration(milliseconds: 100), () {
      if (_scaffoldKey.currentState != null) {
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myComplain())),
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
                      backgroundColor:
                          const Color.fromARGB(225, 255, 0, 0), // Button color
                      elevation: 5.0, // Button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Button padding
                    ),
                    onPressed: () {
                      logout(context);
                    },
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
    );
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Remove token from storage
    ref.read(tokenProvider.notifier).clearToken();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartScreen()),
    );
  }

  void onPressFunction(BuildContext context, {required int index}) {
    // Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.pop(context);
        break;

      case 1:
        Navigator.pop(context);
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
