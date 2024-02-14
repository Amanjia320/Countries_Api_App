import 'package:flutter/material.dart';
//import 'package:practice1/login.dart';
import 'package:practice1/provider/authprovider.dart';
import 'package:practice1/provider/countprovider.dart';
// import 'package:practice1/favourite.dart';
import 'package:practice1/provider/favouriteprovider.dart';
import 'package:practice1/provider/themechanger.dart';
import 'package:provider/provider.dart';
import 'count.dart';
//import 'darktheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => CountProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          // ignore: unused_local_variable
          final themechanger = Provider.of<ThemeChanger>(
              context); //Yes, final themechanger is a variable that stores the instance of the ThemeChanger class obtained using Provider.of<ThemeChanger>(context).

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // ignore: unnecessary_const
            themeMode: themechanger.thememode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              appBarTheme:
                  AppBarTheme(backgroundColor: Colors.redAccent.shade200),
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme:
                    AppBarTheme(backgroundColor: Colors.teal.shade400)),
            home: CountScreen(),
          );
        }));
  }
}
