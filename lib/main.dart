import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:expenses_tracker_app_fifth_project/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (fn) =>
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        // appBarTheme: const AppBarTheme().copyWith(
        //   backgroundColor: kDarkColorScheme.onPrimaryContainer,
        //   foregroundColor: kDarkColorScheme.primaryContainer,
        // ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        //   textTheme: ThemeData().textTheme.copyWith(
        //         titleLarge: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           color: kDarkColorScheme.onSecondaryContainer,
        //           fontSize: 16,
        //         ),
        //         titleMedium: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           color: kDarkColorScheme.onSecondaryContainer,
        //           fontSize: 8,
        //         ),
        //       ),
        iconTheme: IconThemeData(
            color: kDarkColorScheme.onSecondaryContainer, size: 32),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.onInverseSurface,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
        iconTheme: IconThemeData(
          color: kColorScheme.onPrimaryContainer,
          size: 32,
        ),
      ),
      // themeMode: ThemeMode.light,
      home: const Expenses(),
    ),
  );
  // );
}
