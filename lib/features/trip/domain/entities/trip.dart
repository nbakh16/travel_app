class Trip {
  final String title;
  final String description;
  final List<String> images;
  final String location;
  final DateTime date;

  Trip(
      {required this.title,
      required this.description,
      required this.images,
      required this.location,
      required this.date});
}
