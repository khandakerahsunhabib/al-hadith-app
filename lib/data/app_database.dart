// app_database.dart
import 'package:al_hadith/data/entities/books.dart';
import 'package:al_hadith/data/entities/chapters.dart';
import 'package:al_hadith/data/entities/hadiths.dart';
import 'package:drift/drift.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [Books, Chapters, Hadiths])
class AppDatabase extends _$AppDatabase {}
