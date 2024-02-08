import 'package:flutter/material.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        title: const Text(
          'Title',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: const Text(
          'Note content should be here',
          style: TextStyle(fontSize: 16),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
