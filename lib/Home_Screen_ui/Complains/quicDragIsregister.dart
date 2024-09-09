import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Navigation_menu.dart';
import '../home_screen.dart';

class Quick_DragIsRegister extends StatefulWidget {
  const Quick_DragIsRegister({super.key});

  @override
  State<Quick_DragIsRegister> createState() => _Quick_DragIsRegisterState();
}

class _Quick_DragIsRegisterState extends State<Quick_DragIsRegister> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
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
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    'assets/Male Memojis.png',
                  )),
              SizedBox(height: 20),
              const Text(
                'Your Complain is Registered!',
                style: TextStyle(
                  color: Color(0xFF01A24F),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 45),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigationMenu(),
                          ),
                          (route) => false);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Done :)',
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
        );
      },
    );
  }
}
