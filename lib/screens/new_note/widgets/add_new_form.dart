import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/shared/widgets/app_button.dart';
import 'package:notes_app/shared/widgets/custom_text_field.dart';

class AddNewForm extends StatefulWidget {
  const AddNewForm({
    super.key,
  });

  @override
  State<AddNewForm> createState() => _AddNewFormState();
}

class _AddNewFormState extends State<AddNewForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  DateFormat formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
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
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return AppButton(
                  isLoading: state is AddNoteLoading,
                  text: 'Add',
                  function: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      NoteModel note = NoteModel(
                        title: titleController.text,
                        subTitle: noteController.text,
                        date: formatter.format(DateTime.now()),
                        color: Colors.cyan.value,
                      );
                      AddNoteCubit.get(context).addNote(note);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  });
            },
          ),
          SizedBox(height: screenHeight(context) * .04),
        ],
      ),
    );
  }
}
