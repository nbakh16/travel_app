import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class AddTripView extends ConsumerWidget {
  AddTripView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEController =
      TextEditingController(text: 'Title');
  final TextEditingController _descTEController =
      TextEditingController(text: 'This is my trip description');
  final TextEditingController _locationTEController =
      TextEditingController(text: 'Location');
  final TextEditingController _imageTEController = TextEditingController(
      text: 'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b');
  List<String> images = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleTEController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _descTEController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _locationTEController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextFormField(
              controller: _imageTEController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                images.add(_imageTEController.text);
                if (_formKey.currentState!.validate()) {
                  final Trip newTrip = Trip(
                    title: _titleTEController.text,
                    description: _descTEController.text,
                    images: images,
                    location: _locationTEController.text,
                    date: DateTime.now(),
                  );
                  ref
                      .read(tripListNotifierProvider.notifier)
                      .addNewTrip(newTrip);
                }
              },
              child: const Text('Add Trip'),
            ),
          ],
        ),
      ),
    );
  }
}
