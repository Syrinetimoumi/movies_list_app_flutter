import 'package:flutter/material.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MoviesHome(),
    );
  }
}

class MoviesHome extends StatelessWidget {
  final List<Map<String, String>> series = [
    {
      'title': 'Breaking Bad',
      'image': 'image/breaking_bad.jpg', // Use the local image path
      'description': 'Breaking Bad is a show about ...'
    },
    {
      'title': 'Stranger Things',
      'image': 'image/stranger things.jpg', // Use the local image path
      'description': 'Stranger Things is a show about ...'
    },
    {
      'title': 'Game of Thrones',
      'image': 'image/game of thrones.jpg', // Use the local image path
      'description': 'Game of Thrones is a show about ...'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular TV Series'),
      ),
      body: ListView.builder(
        itemCount: series.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeriesDetail(series: series[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.asset(
                  series[index]['image']!, // Use Image.asset for local images
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(series[index]['title']!),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SeriesDetail extends StatelessWidget {
  final Map<String, String> series;

  SeriesDetail({required this.series});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(series['title']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              series['image']!, // Use Image.asset for local images
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              series['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              series['description']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
