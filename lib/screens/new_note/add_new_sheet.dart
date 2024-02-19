import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/screens/new_note/widgets/add_new_form.dart';
import 'package:notes_app/shared/constants.dart';

class NewNoteSheet extends StatelessWidget {
  const NewNoteSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            NotesCubit.get(context).getAllNotes();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                  bottom: keyboardHeight(context),
                ),
                width: screenWidth(context),
                child: const AddNewForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
