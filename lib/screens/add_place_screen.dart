import 'package:flutter/material.dart';
import 'package:great_places_app/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const String routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add A New Place'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title', labelStyle: TextStyle(color: Colors.grey)),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 10,),
                    const ImageInput()
                  ],
                ),
              ),
            )),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                tapTargetSize:
                    MaterialTapTargetSize.shrinkWrap, // remove extra margin
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ));
  }
}
