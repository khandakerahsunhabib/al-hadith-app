import 'package:drift/drift.dart';
import 'package:al_hadith/data/entities/books.dart';

@DataClassName('Chapter')
class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId =>
      integer().customConstraint('REFERENCES books(id)')();
  IntColumn get bookId =>
      integer().nullable().customConstraint('REFERENCES books(id)')();
  TextColumn get title => text().withLength(min: 1, max: 50)();
}
