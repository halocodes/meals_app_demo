import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/screens/tab_bar_screen.dart';

void main() {
  runApp(App());
}

final kColorSchemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: kColorSchemeDark,
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: kColorSchemeDark.onSurface,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 63, 28, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: TabBarScreen(),
    );
  }
}
