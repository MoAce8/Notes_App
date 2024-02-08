import 'package:flutter/material.dart';
import 'package:notes_app/screens/home/widgets/notes_item.dart';
import 'package:notes_app/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          Container(
            padding: EdgeInsets.all(screenWidth(context) * 0.01),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: const NotesItem(),
    );
  }
}
