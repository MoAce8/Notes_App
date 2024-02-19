import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/screens/home/widgets/notes_item.dart';
import 'package:notes_app/screens/new_note/add_new_sheet.dart';
import 'package:notes_app/shared/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    NotesCubit.get(context).getAllNotes();
    super.initState();
  }
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
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return ListView.separated(
            padding: const EdgeInsets.only(
              top: 6,
              left: 16,
              right: 16,
            ),
            itemBuilder: (context, index) => NotesItem(note: NotesCubit.get(context).notes[index]),
            separatorBuilder: (context, index) =>
                SizedBox(
                  height: screenHeight(context) * .01,
                ),
            itemCount: NotesCubit.get(context).notes.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )
            ),
            context: context, builder: (context) => const NewNoteSheet(),);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
