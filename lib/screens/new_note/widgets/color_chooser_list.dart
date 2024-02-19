import 'package:flutter/material.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 26,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 30,
          );
  }
}

class ColorList extends StatefulWidget {
  const ColorList({Key? key}) : super(key: key);

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  final List colors = const [
    Colors.cyan,
    Color(0xff3887BE),
    Color(0xff38419D),
    Color(0xff176B87),
    Color(0xffB4D4FF),
  ];

  int currentIndex = 0;

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
                AddNoteCubit.get(context).color = colors[index];
              });
            },
            child: ColorItem(
              isActive: currentIndex == index,
              color: colors[index],
            )),
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        itemCount: colors.length,
      ),
    );
  }
}
