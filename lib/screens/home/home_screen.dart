import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/screens/home/widgets/notes_item.dart';
import 'package:notes_app/screens/new_note/add_new_sheet.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/shared/widgets/custom_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  late List searchedNotes;

  @override
  void initState() {
    NotesCubit.get(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return ListView.separated(
            padding: const EdgeInsets.only(
              top: 6,
              left: 16,
              right: 16,
            ),
            itemBuilder: (context, index) => NotesItem(
                note: searchController.text.isEmpty
                    ? NotesCubit.get(context).notes[index]
                    : searchedNotes[index]),
            separatorBuilder: (context, index) => SizedBox(
              height: screenHeight(context) * .01,
            ),
            itemCount: searchController.text.isEmpty
                ? NotesCubit.get(context).notes.length
                : searchedNotes.length,
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
            )),
            context: context,
            builder: (context) => const NewNoteSheet(),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: isSearching
          ? TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search for note',
              ),
              onChanged: (value) {
                setState(() {
                  searchedNotes = NotesCubit.get(context)
                      .notes
                      .where((note) =>
                          note.title.toLowerCase().contains(value) ||
                          note.subTitle.toLowerCase().contains(value))
                      .toList();
                });
              },
            )
          : const Text('Notes'),
      actions: [
        isSearching
            ? IconButton(
                onPressed: () {
                  if (searchController.text.isEmpty) {
                    Navigator.pop(context);
                  }
                  setState(() {
                    searchController.clear();
                  });
                },
                icon: const Icon(Icons.clear),
              )
            : CustomIconButton(
                icon: Icons.search,
                onPressed: () {
                  setState(() {
                    isSearching = true;
                  });
                  ModalRoute.of(context)!.addLocalHistoryEntry(
                      LocalHistoryEntry(onRemove: stopSearching));
                },
              )
      ],
    );
  }

  stopSearching() {
    setState(() {
      searchController.clear();
      isSearching = false;
    });
  }
}
