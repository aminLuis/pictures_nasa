class NasaImage {
  final String title;
  final String imageUrl;
  final String description;

  NasaImage({
    required this.title,
    required this.imageUrl,
    required this.description
  });

  factory NasaImage.fromJson(Map<String, dynamic> json, String category) {
    if (category == 'APOD') {
      return NasaImage(
        title: json['title'] ?? 'Sin título',
        imageUrl: json['url'],
        description: json['explanation']
      );
    } else {
      return NasaImage(
        title: 'Foto del rover',
        imageUrl: json['img_src'],
        description: json['camera']['full_name']
      );
    }
  }
}