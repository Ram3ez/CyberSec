import 'package:cyber_sec/pages/about.dart';
import 'package:cyber_sec/pages/home.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;

  List<Widget> pages = [Home(), About()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        textTheme: TextTheme(
          bodySmall: GoogleFonts.nunito(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
          titleLarge: GoogleFonts.nunito(
            fontSize: 24,
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.nunito(
            fontSize: 20,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.nunito(
            fontSize: 18,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.nunito(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent,
        textTheme: TextTheme(
          bodySmall: GoogleFonts.nunito(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
          titleLarge: GoogleFonts.nunito(
            fontSize: 24,
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.nunito(
            fontSize: 20,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.nunito(
            fontSize: 18,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.nunito(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "CyberSec",
            style: GoogleFonts.nunito(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: pages[index],
        bottomNavigationBar: NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
          },
          indicatorColor: Colors.redAccent.withAlpha(90),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(
              icon: Icon(Icons.info_outline_rounded),
              label: "About",
            ),
          ],
        ),
      ),
    );
  }
}
