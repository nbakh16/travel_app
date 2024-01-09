import 'package:dartz/dartz.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';

import '../../../../core/error/failure.dart';

abstract class TripRepo {
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}
