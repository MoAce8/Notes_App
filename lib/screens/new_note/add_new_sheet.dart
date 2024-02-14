import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/shared/widgets/app_button.dart';
import 'package:notes_app/shared/widgets/custom_text_field.dart';

class NewNoteSheet extends StatefulWidget {
   NewNoteSheet({Key? key}) : super(key: key);

  @override
  State<NewNoteSheet> createState() => _NewNoteSheetState();
}

class _NewNoteSheetState extends State<NewNoteSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: screenWidth(context),
      child: Column(
        children: [
          SizedBox(height: screenHeight(context) * .05),
          AppTextField(
            label: 'Title',
            controller: titleController,
          ),
          SizedBox(height: screenHeight(context) * .025),
          AppTextField(
            label: 'Enter Note',
            controller: noteController,
            maxLines: 5,
          ),
          SizedBox(height: screenHeight(context) * .08),
          AppButton(
              text: 'Add',
              function: () {
                Navigator.pop(context);
                print(titleController.text);
                print(noteController.text);
              }),
        ],
      ),
    );
  }
}
