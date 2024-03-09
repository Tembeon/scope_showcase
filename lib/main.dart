import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sandbox_enclosed/src/core/data/sources/local/db/db.dart';
import 'package:sandbox_enclosed/src/core/widgets/app.dart';

void main() => runZonedGuarded(
      initializeApp,
      (error, stack) {
        print('runZonedGuarded: Caught error: $error');
      },
    );

void initializeApp() async {
  runApp(const MaterialApp(
    home: Center(
      child: CircularProgressIndicator(),
    ),
  ));

  final db = await rootInitialization();

  runApp(SandBoxApp(db: db));
}

Future<IDatabase> rootInitialization() async {
  final db = IDatabase.sharedPreferences();
  await db.init();

  await Future.delayed(const Duration(seconds: 2));

  return db;
}
