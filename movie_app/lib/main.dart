// ignore: unused_import
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_app/injector.dart';
import 'package:movie_app/view_model/providers/movie_discover_provider.dart';
import 'package:movie_app/view_model/providers/movie_top_rated_provider.dart';
import 'package:movie_app/views/screens/login_page_screen.dart';
import 'package:provider/provider.dart';
import 'view_model/providers/movie_search_provider.dart';

void main() {
  // untuk menjalankan fungsi splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // untuk memangil injector-nya
  setup();

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieDiscoverProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieTopRatedProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieSearchProvider>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movie',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const LoginPageScreen(),
      ),
    );
  }
}
