import 'package:flutter/material.dart';
import 'package:pictures_nasa/screens/category_screen.dart';

class HomeScreen extends StatelessWidget {

  final List<String> categories = ['APOD', 'Mars Rovers'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nasa pictures')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}