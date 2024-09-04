// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  var id;
  var firstName;
  var lastName;
  var phoneNo;
  var homelocationLatitude;
  var homelocationLongitutde;
  double currentlocationLatitude;
  double currentlocationLongitutde;

  MongoDbModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.homelocationLatitude,
    required this.homelocationLongitutde,
    required this.currentlocationLatitude,
    required this.currentlocationLongitutde,
  });

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    id: json["_id"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    phoneNo: json["phoneNo"],
    homelocationLatitude: json["Homelocation_latitude"]?.toDouble(),
    homelocationLongitutde: json["Homelocation_longitutde"]?.toDouble(),
    currentlocationLatitude: json["Currentlocation_latitude"]?.toDouble(),
    currentlocationLongitutde: json["Currentlocation_longitutde"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "phoneNo": phoneNo,
    "Homelocation_latitude": homelocationLatitude,
    "Homelocation_longitutde": homelocationLongitutde,
    "Currentlocation_latitude": currentlocationLatitude,
    "Currentlocation_longitutde": currentlocationLongitutde,
  };
}
