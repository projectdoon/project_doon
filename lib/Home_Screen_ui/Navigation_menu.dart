import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'Services_screen.dart';
import 'home_screen.dart';

class NavigationMenu extends StatelessWidget{
  const NavigationMenu({super.key});



  @override
  Widget build( context) {final controller = Get.put(NavigationController());


    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          backgroundColor: Colors.white,

          height: 80,
          shadowColor: Colors.black,
          elevation: 15,

          selectedIndex: controller.selectedIndex.value,


         indicatorColor: Color.fromARGB(76, 58, 129, 241),
         
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.apps), label: 'Services'),
            NavigationDestination(
                icon: Icon(Icons.headphones), label: 'contact us'),
            NavigationDestination(
                icon: Icon(Icons.account_circle_outlined), label: 'My Profile'),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }

}

class NavigationController extends GetxController{

  final Rx<int> selectedIndex =0.obs;
  final screens =[HomeScreen(),ServicesScreen()];
}