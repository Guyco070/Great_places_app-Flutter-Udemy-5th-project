import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: const Center(
                    child: Text('Got no places yet, start adding some!')),
                builder: (context, greatPlaces, child) => greatPlaces
                        .items.isEmpty
                    ? child!
                    : ListView.builder(
                        itemCount: greatPlaces.items.length,
                        itemBuilder: ((context, index) => ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      greatPlaces.items[index].image)),
                              title: Text(greatPlaces.items[index].title),
                              subtitle: Text(
                                  greatPlaces.items[index].location!.address!),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PlaceDetailScreen.routeName, arguments: greatPlaces.items[index].id);
                              },
                            )))),
      ),
    );
  }
}
