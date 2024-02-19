import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_note/edit_note_screen.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteScreen(note: note),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 24, left: 12),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note.subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  NotesCubit.get(context).getAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
