import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/new_note/widgets/color_chooser_list.dart';
import 'package:notes_app/shared/constants.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {


  late int currentIndex;
  @override
  void initState() {
    currentIndex = appColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.note.color=appColors[index].value;
              });
            },
            child: ColorItem(
              isActive: currentIndex == index,
              color: appColors[index],
            )),
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        itemCount: appColors.length,
      ),
    );
  }
}
