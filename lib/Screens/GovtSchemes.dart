import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydoon/DummyData/GovSchemes.dart';
import 'package:transparent_image/transparent_image.dart';

class Govtschemes extends StatefulWidget {
  const Govtschemes({super.key});

  @override
  State<Govtschemes> createState() => _GovtschemesState();
}

class _GovtschemesState extends State<Govtschemes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
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
                      'All Govt. Schems',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                ],
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummySchemes.length,
                itemBuilder: (ctx, index) {
                  final scheme = dummySchemes[index];
                  return Card(

                    shadowColor: Colors.blue,
                    margin: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.hardEdge,
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                      },
                      child: Stack(
                        children: [
                          Hero(
                            tag: scheme.id,
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(scheme.imageUrl),
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(left: 6,right: 6,top: 12),
                              child: Column(
                                children: [
                                  Text(
                                    scheme.title,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  // return Card(
                  //   margin: EdgeInsets.all(10),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   elevation: 5,
                  //   child: ListTile(
                  //     leading: Image.network(
                  //       scheme.imageUrl,
                  //       width: 50,
                  //       height: 50,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     title: Text(scheme.title),
                  //     onTap: () {},
                  //   ),
                  // );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
