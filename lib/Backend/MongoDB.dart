import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'MongoDBModel.dart';
import 'constant.dart';

class MongoDatabase {

  static var db ,usercollection;

  static connect() async{
    db =await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    usercollection=db.collection(USER_COLLECTION);

  }
  static Future<String> insert(MongoDbModel data) async{
    try{

      var result =await usercollection.insertOne(data.toJson());

      if(result.isSuccess){
        return 'data inserted';
      }
      else{
        return "error inserting";
      }

    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }

}