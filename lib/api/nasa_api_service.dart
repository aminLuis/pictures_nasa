import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApiService {
  final String _apiKey = 'mJXCFiDINQhOZ6N1ec1S0qOllbh8zFfa6NyPLtVD';

  Future<List<Map<String, dynamic>>> fetchImages(String category) async {
    String url = '';

    switch(category) {
      case 'APOD':
      url = 'https://api.nasa.gov/planetary/apod?api_key=$_apiKey&count=10';
      break;
      case 'Mars Rovers':
        url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=$_apiKey';
      break;
      default:
      throw Exception('Categoría desconocida');
    }
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final data = json.decode(response.body);
      return category == 'APOD' ? List<Map<String, dynamic>>.from(data) : List<Map<String, dynamic>>.from(data['photos']);
    } else {
      throw Exception('Error al cargar imágenes');
    }
  }
}