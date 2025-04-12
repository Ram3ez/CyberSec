import 'package:cyber_sec/pages/about_page.dart';
import 'package:cyber_sec/pages/home_page.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(LandingPage());
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ThemeData lightTheme = ThemeData(
    primaryColor: Colors.redAccent,
    cardColor: Colors.grey,
    canvasColor: Colors.white,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.nunito(fontSize: 16, color: Colors.grey.shade900),
      titleLarge: GoogleFonts.nunito(
        fontSize: 24,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.nunito(
        fontSize: 20,
        color: Colors.black.withAlpha(200),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.nunito(
        fontSize: 18,
        color: Colors.black.withAlpha(170),
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
      headlineLarge: GoogleFonts.nunito(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.redAccent.withAlpha(180),
    cardColor: Colors.white.withAlpha(20),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.nunito(fontSize: 16, color: Colors.white70),
      titleLarge: GoogleFonts.nunito(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.nunito(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.nunito(
        fontSize: 18,
        color: Colors.white.withAlpha(220),
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: GoogleFonts.nunito(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;

  List<Widget> pages = [HomePage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("CyberSec", style: Theme.of(context).textTheme.titleLarge),
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
    );
  }
}
