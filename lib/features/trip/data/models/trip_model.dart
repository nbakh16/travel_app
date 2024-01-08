import 'package:hive/hive.dart';

import '../../domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final List<String> images;
  @HiveField(3)
  final String location;
  @HiveField(4)
  final DateTime date;

  TripModel(
      {required this.title,
      required this.description,
      required this.images,
      required this.location,
      required this.date});

  //conversion from Entity to Model
  factory TripModel.fromEntity(Trip trip) => TripModel(
        title: trip.title,
        description: trip.description,
        images: trip.images,
        location: trip.location,
        date: trip.date,
      );

  //Conversion from Model to Entity
  Trip toEntity() => Trip(
        title: title,
        description: description,
        images: images,
        location: location,
        date: date,
      );
}
