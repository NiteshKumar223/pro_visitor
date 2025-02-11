import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_visitor/Screens/Todo_Folder/todo_models/todo_data.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    //final time = DateFormat.yMMMd().format(note.datetime);
    //final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        //constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            ListTile(
            leading: Icon(Icons.description_outlined),
            title: Text(
              note.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                ),
            ),
            //SizedBox(height: 4),
            subtitle: Text(
              note.datetime,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            )
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  /*double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }*/
}