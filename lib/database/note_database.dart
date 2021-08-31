import 'package:floor/floor.dart';
import 'package:journal_app/database/data.dart';
import 'package:journal_app/database/notedao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
