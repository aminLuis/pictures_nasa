import 'package:flutter/material.dart';
import 'package:pictures_nasa/api/nasa_api_service.dart';
import 'package:pictures_nasa/models/nasa_image.dart';

class CategoryScreen extends StatelessWidget {
  
  final String category;

  CategoryScreen({
    required this.category
  });

  final NasaApiService _apiService = NasaApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: FutureBuilder(
        future: _apiService.fetchImages(category),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<NasaImage> images = (snapshot.data as List)
            .map((data) => NasaImage.fromJson(data, category))
            .toList();

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(images[index].imageUrl, fit: BoxFit.cover),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          images[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
              }
            );
          }
        },
      ),
    );
  }

}