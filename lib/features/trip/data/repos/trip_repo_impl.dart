import 'package:dartz/dartz.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repos/trip_repo.dart';

import '../../../../core/error/failure.dart';
import '../models/trip_model.dart';

class TripRepoImpl implements TripRepo {
  final TripLocalDataSource tripLocalDataSource;

  TripRepoImpl(this.tripLocalDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    tripLocalDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    tripLocalDataSource.deleteTrip(index);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = tripLocalDataSource.getTrips();
      List<Trip> listOfTrips = tripModels.map((e) => e.toEntity()).toList();
      return Right(listOfTrips);
    } catch (e) {
      return Left(FailedError(e.toString()));
    }
  }
}
