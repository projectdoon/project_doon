import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mydoon/Screens/Capa_module_screen.dart';


class CategoryIconThird extends StatefulWidget {
  const CategoryIconThird({super.key});

  @override
  State<CategoryIconThird> createState() => _CategoryIconThirdState();
}

class _CategoryIconThirdState extends State<CategoryIconThird> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectsScreen(),
                  ),
                );
              },
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedAudit01,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Social\naudit',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedRealEstate02,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Rent\nProperty',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedFiles01,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Gov.\nServices',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Column(
          children: [
            RawMaterialButton(
              onPressed: () {},
              constraints: const BoxConstraints.tightFor(width: 55, height: 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color.fromARGB(255, 58, 129, 241),
                  width: 1.5,
                ),
              ),
              fillColor: const Color.fromARGB(255, 211, 227, 251),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedFiles02,
                color: Colors.black,
                size:
                    26, // You might need to explicitly pass size if HugeIcon supports it
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Gov\nSchemes',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}
