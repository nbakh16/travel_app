import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';
import '../../domain/entities/trip.dart';

class MyTripsView extends ConsumerWidget {
  const MyTripsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Trip> tripList = ref.watch(tripListNotifierProvider);
    return ListView.builder(
      itemCount: tripList.length,
      itemBuilder: (context, index) {
        final Trip trip = tripList[index];
        return Text(trip.title);
      },
    );
  }
}
