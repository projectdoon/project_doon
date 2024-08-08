import 'package:mongo_dart/mongo_dart.dart';
import 'package:mydoon/Backend/constant.dart';

class MongoDatabase{
  static var db ,userCollection;
  static connect()async{
    print("establishing connection to database started");
    db=await Db.create(MONGO_CONN_URL);
    await db.open;
    print('connected to database successfully');

  }
}