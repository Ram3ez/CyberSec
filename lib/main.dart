import 'package:cyber_sec/pages/about.dart';
import 'package:cyber_sec/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      // Use the system's theme mode (light/dark)
      themeMode: ThemeMode.dark,
      // Light theme configuration
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade900,
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      // Dark theme configuration
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          bodySmall: GoogleFonts.nunito(
            fontSize: 16,
            color: Colors.grey.shade300,
          ),
          titleLarge: GoogleFonts.nunito(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.nunito(
            fontSize: 20,
            color: Colors.grey.shade200,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.nunito(
            fontSize: 18,
            color: Colors.grey.shade300,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.nunito(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("CyberSec"), centerTitle: true),
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
          // Indicator color now dynamically uses the primary color of the current theme
          indicatorColor: Theme.of(context).primaryColor.withAlpha(90),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              label: "About",
            ),
          ],
        ),
      ),
    );
  }
}
