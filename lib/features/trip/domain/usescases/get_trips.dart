import 'package:dartz/dartz.dart';
import 'package:travel_app/features/trip/domain/repos/trip_repo.dart';
import '../../../../core/error/failure.dart';
import '../entities/trip.dart';

class GetTrips {
  final TripRepo repo;

  GetTrips(this.repo);

  Future<Either<Failure, List<Trip>>> call() {
    return repo.getTrips();
  }
}
