import 'package:travel_app/features/trip/domain/entities/trip.dart';

abstract class TripRepo {
  Future<Trip> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}
