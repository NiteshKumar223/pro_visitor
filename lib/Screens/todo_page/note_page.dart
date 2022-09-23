import 'package:flutter/material.dart';
import 'package:pro_visitor/Screens/todo_Database/todo_dbhelper.dart';
import 'package:pro_visitor/Screens/todo_models/todo_data.dart';
import 'package:pro_visitor/Screens/todo_page/edit_note_page.dart';
import 'package:pro_visitor/Screens/todo_widget/note_card_widget.dart';
import 'package:pro_visitor/Screens/todo_page/note_detail_page.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome To Visitor Log',
            style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.bold,
            ),
          ),
          //actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Color(0xff3FC120), fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff3FC120),
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => ListView.builder(
        padding: EdgeInsets.all(2),
        itemCount: notes.length,
        /*ListView: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,*/
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}