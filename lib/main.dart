import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:journal_app/database/note_database.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<NoteDatabase>(
          future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
          builder: (context, data) {
            if (data.hasData) {
              Get.put(data.data!.noteDao);
              return HomePage();
            } else if (data.hasError) {
              return Text('${data.error}');
            } else {
              return Text('Loading');
            }
          },
        ));
  }
}
