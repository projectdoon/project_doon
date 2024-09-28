import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mydoon/User%20Profile/MyComplain.dart';
import 'package:mydoon/config.dart';
import 'isRegister.dart';

class complainExpanded extends StatefulWidget {
  const complainExpanded({super.key,required this.token});

  final token;

  @override
  State<complainExpanded> createState() => _allComplainState();
}

class _allComplainState extends State<complainExpanded> {
  List<String> itemsofComplain = [
    "Garbage Collection",
    "Dead Animal",
    "Water Leakage"
  ];
  String? selectedComplain;
  File? selectedImage;
  String base64Image = "";
  String imageUrl='';
  final descriptionController = TextEditingController();
  bool _isNotValidate = false;
  late String userId;

  Future<void> select_image(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 70);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // print(base64Image);
      });
      String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();

      //get a refrence to storage root
      Reference referenceRoot =FirebaseStorage.instance.ref();
      Reference referenceDirImages =referenceRoot.child('images');

      //create a reference for the image to be stored

      Reference referenceImageToUplaod =referenceDirImages.child(uniqueFileName);

      //Store the file
      try{
        await referenceImageToUplaod.putFile(File(image.path));
        imageUrl=await referenceImageToUplaod.getDownloadURL();
      }catch(error){

      }
    }

  }
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
   userId = jwtDecodedToken['_id'];
  }

  void registerComplain() async {
    print('chala1');
    if (descriptionController.text.isNotEmpty) {
      var complainRegBody = {
        "userId":userId,
        "Category": selectedComplain,
        "Description": descriptionController.text.toString(),
        "Status": 0,
        "Burst": 0,
        "Lat": 123,
        "Long": 23
      };
      print('chala2');

      try {
        print(userId);
        print(imageUrl);
        var response = await http.post(Uri.parse(complainRegistration),
            headers: {"content-type": "application/json"},
            body: jsonEncode(complainRegBody));
        var jsonResponse = jsonDecode(response.body);
        print('chala4');
        print(jsonResponse['status']);


        if (jsonResponse['status']) {
          print('chala5');
          descriptionController.clear();

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Registered Successfully"),
          ));
          myComplainState().getComplainList(userId);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Isregister()),
          );

        } else {
          print('something went wrong');
        }
      }
      catch (err) {
        print('nahichala1');
        print(err);
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 48),
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
                        'Complain',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.02), // Equal spacing on the right
                  ],
                ),
              ),

              const SizedBox(
                height: 95,
              ),

              DropdownButton<String>(
                padding: const EdgeInsets.only(left: 30, right: 30),
                value: selectedComplain,
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
                      style: const TextStyle(
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
                    selectedComplain = value;
                  });
                },
              ),

              const SizedBox(height: 30),

              Container(
                width: 450,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(

                  controller: descriptionController,
                  decoration: InputDecoration(
                    errorText: _isNotValidate ? "enter proper info" : null,
                    hintText: 'Add a Comment:',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: 450,
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
                      select_image("camera");
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Upload A Picture',
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

              const SizedBox(height: 35),

              // speak to complain
              Container(
                width: 450,
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
                    onPressed: () async {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Speak To Complain',
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

              const SizedBox(height: 55),

              Container(
                width: 450,
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
                      registerComplain();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register A complain',
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

              const SizedBox(height: 20),

              if (selectedImage != null)
                CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(selectedImage!),
                )
              else
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
