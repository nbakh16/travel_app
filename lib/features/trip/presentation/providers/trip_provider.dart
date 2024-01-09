import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repos/trip_repo.dart';
import 'package:travel_app/features/trip/domain/usescases/add_trip.dart';
import 'package:travel_app/features/trip/domain/usescases/delete_trip.dart';
import 'package:travel_app/features/trip/domain/usescases/get_trips.dart';
import '../../data/repos/trip_repo_impl.dart';

final tripLocalDataProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

final tripRepoProvider = Provider<TripRepo>((ref) {
  final localData = ref.read(tripLocalDataProvider);
  return TripRepoImpl(localData);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repo = ref.read(tripRepoProvider);
  return AddTrip(repo);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repo = ref.read(tripRepoProvider);
  return GetTrips(repo);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repo = ref.read(tripRepoProvider);
  return DeleteTrip(repo);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final addTrip = ref.read(addTripProvider);
  final getTrips = ref.read(getTripsProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(addTrip, getTrips, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  TripListNotifier(this._addTrip, this._getTrips, this._deleteTrip) : super([]);
  final AddTrip _addTrip;
  final GetTrips _getTrips;
  final DeleteTrip _deleteTrip;

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> removeTrip(int index) async {
    await _deleteTrip(index);
  }

  Future<void> loadTrips() async {
    await _getTrips();
  }
}
