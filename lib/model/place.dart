class Place {
  String name;
  String location;
  String description;

  String imageAsset;
  List<String> imageUrls;

  Place({
    required this.name,
    required this.location,
    required this.description,

    required this.imageAsset,
    required this.imageUrls,
  });
}