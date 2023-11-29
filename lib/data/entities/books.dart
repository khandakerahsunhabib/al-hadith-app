import 'package:drift/drift.dart';

@DataClassName('Book')
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
}
