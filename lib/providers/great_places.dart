import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [
    Place(id: '1111', title: 'title', location: PlaceLocation(latitude: 5, longitude: 9, address:  'ssss'), image: File('sss')),
  ];

  List<Place> get items {
    return [..._items];
  }
}
