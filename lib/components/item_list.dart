import 'package:flutter/material.dart';

class MyListItem  extends StatelessWidget {
  const MyListItem ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 500,
              color: Colors.amber[500],
              child: Center(child: Text('Entry 1')),
            );
          }
      )
    );
  }
}
