import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/shared/widgets/app_button.dart';
import 'package:notes_app/shared/widgets/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

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
                icon: const Icon(Icons.check),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: screenWidth(context),
        child: Column(
          children: [
            SizedBox(height: screenHeight(context) * .05),
            AppTextFormField(
              label: 'Title',
              controller: titleController,
            ),
            SizedBox(height: screenHeight(context) * .025),
            AppTextFormField(
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
      ),
    );
  }
}
