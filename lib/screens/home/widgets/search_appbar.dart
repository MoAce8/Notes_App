import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
    this.onChanged,
    this.controller,
    this.iconFunction,
  }) : super(key: key);
  
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? iconFunction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Search for note',
        ),
        onChanged: onChanged,
      ),
      actions: [
        IconButton(
          onPressed: iconFunction,
          icon: const Icon(Icons.clear),
        )
      ],
    );
  }
}


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, this.iconFunction}) : super(key: key);

  final void Function()? iconFunction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Notes'),
      actions: [
        Container(
          padding: EdgeInsets.all(screenWidth(context) * 0.01),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.withOpacity(.2)),
            child: IconButton(
              onPressed: iconFunction,
              icon: const Icon(Icons.search),
            ),
          ),
        )
      ],
    );
  }
}
