import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/src/config/color.dart';
import 'package:sample/src/views/core/core.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Stain.none, // transparent status bar
  ));
  runApp(const Core());
}
