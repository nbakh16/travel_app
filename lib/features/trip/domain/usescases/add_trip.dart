import 'package:travel_app/features/trip/domain/repos/trip_repo.dart';
import '../entities/trip.dart';

class AddTrip {
  final TripRepo repo;

  AddTrip(this.repo);

  Future<void> call(Trip trip) {
    return repo.addTrip(trip);
  }
}
