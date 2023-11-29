import 'package:drift/drift.dart';
import 'package:al_hadith/data/entities/chapters.dart';

@DataClassName('Hadith')
class Hadiths extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId =>
      integer().nullable().customConstraint('REFERENCES chapters(id)')();
  TextColumn get bn => text().nullable()();
}
