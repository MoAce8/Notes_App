import 'package:flutter/material.dart';
import 'package:notes_app/screens/home/widgets/notes_item.dart';
import 'package:notes_app/screens/new_note/add_new_sheet.dart';
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
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.grey.withOpacity(.2)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: 6,
          left: 16,
          right: 16,
        ),
        itemBuilder: (context, index) => NotesItem(),
        separatorBuilder: (context, index) =>
            SizedBox(
              height: screenHeight(context) * .01,
            ),
        itemCount: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
            ),
            context: context, builder: (context) => NewNoteSheet(),);
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }
}
