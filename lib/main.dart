import 'package:flutter/material.dart';
import 'package:my_world_app/pages/home.dart';
import 'package:my_world_app/pages/loading.dart';
import 'package:my_world_app/pages/choose_location.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => ChooseLocation(),
        }));
