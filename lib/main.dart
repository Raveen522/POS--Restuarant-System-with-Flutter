import 'package:flutter/material.dart';
import 'package:pos/screens/login_screen.dart';
import 'package:pos/theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:firedart/firedart.dart';

const apiKey = '';
const projectId = 'myrestuarant-c65ae';

void main() async {
  Firestore.initialize(projectId);
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();


//make window resizing to value as following
  WindowOptions windowOptions = const WindowOptions(
      size: Size(1360, 790),
      minimumSize: Size(1200, 730),
      center: true,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      title: "Restaurant POS");

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: themeText,
      primarySwatch: Colors.amber,
      elevatedButtonTheme: themeButton,
    ),
    home: const LoginScreen(),
  ));
}
