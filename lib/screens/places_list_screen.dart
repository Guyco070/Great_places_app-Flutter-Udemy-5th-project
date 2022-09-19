import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var places = Provider.of<GreatPlaces>(context, listen: false).items;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddPlaceScreen.routeName);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Container(
          child: ListView.builder(
              itemCount: places.length,
              itemBuilder: ((context, index) =>
                  Card(child: Text(places[index].title)))),
        ));
  }
}
