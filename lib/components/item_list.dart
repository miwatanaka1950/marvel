import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comics Catalog',
      home: ComicsCatalog(),
    );
  }
}

class ComicsCatalog extends StatelessWidget {
  final List<String> comics = [
    'Comic 1',
    'Comic 2',
    'Comic 3',
    'Comic 4',
    'Comic 5',
  ];

  int _selectedComicIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comics Catalog'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: comics.length,
              onPageChanged: (index) {
                _selectedComicIndex = index;
              },
              itemBuilder: (context, index) {
                return ComicDetailPage(comicTitle: comics[index]);
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: comics.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _selectedComicIndex = index;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(comics[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ComicDetailPage extends StatelessWidget {
  final String comicTitle;

  ComicDetailPage({required this.comicTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comicTitle),
      ),
      body: Center(
        child: Text('Details for $comicTitle'),
      ),
    );
  }
}
