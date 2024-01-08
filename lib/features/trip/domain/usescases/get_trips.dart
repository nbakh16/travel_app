import 'package:travel_app/features/trip/domain/repos/trip_repo.dart';
import '../entities/trip.dart';

class GetTrips {
  final TripRepo repo;

  GetTrips(this.repo);

  Future<List<Trip>> call() {
    return repo.getTrips();
  }
}
