import 'package:travel_app/features/trip/domain/repos/trip_repo.dart';

class DeleteTrip {
  final TripRepo repo;

  DeleteTrip(this.repo);

  Future<void> call(int index) {
    return repo.deleteTrip(index);
  }
}
