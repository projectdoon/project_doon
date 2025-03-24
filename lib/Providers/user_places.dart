import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

import '../models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title,File image ,PlaceLocation location) async{

    final appDir=await syspaths.getApplicationDocumentsDirectory();
    final filename= path.basename(image.path);
    final copiedImage=await image.copy('${appDir.path}/$filename');

    final newPLace = Place(title: title,image: copiedImage ,location: location);

    state = [newPLace, ...state];
  }
}

final userPlacesProvider =
StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
);
