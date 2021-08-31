import 'package:flutter/material.dart';
import 'package:journal_app/database/note_database.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<NoteDatabase>(
          future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
          builder: (context, data) {
            if (data.hasData) {
              return HomePage(data.data!.noteDao);
            } else if (data.hasError) {
              return Text('${data.error}');
            } else {
              return Text('Loading');
            }
          },
        ));
  }
}
