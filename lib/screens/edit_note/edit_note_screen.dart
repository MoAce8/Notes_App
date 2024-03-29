import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_note/widgets/edit_note_color_list.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/shared/widgets/custom_icon_button.dart';
import 'package:notes_app/shared/widgets/custom_text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          CustomIconButton(
            icon: Icons.check,
            onPressed: () {
              widget.note.title = titleController.text != ''
                  ? titleController.text
                  : widget.note.title;

              widget.note.subTitle = noteController.text != ''
                  ? noteController.text
                  : widget.note.subTitle;

              widget.note.save();
              NotesCubit.get(context).getAllNotes();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: screenWidth(context),
        child: Column(
          children: [
            SizedBox(height: screenHeight(context) * .05),
            AppTextFormField(
              label: widget.note.title,
              controller: titleController,
            ),
            SizedBox(height: screenHeight(context) * .025),
            AppTextFormField(
              label: widget.note.subTitle,
              controller: noteController,
              maxLines: 5,
            ),
            SizedBox(height: screenHeight(context) * .03),
            EditNoteColorList(note: widget.note),
          ],
        ),
      ),
    );
  }
}
