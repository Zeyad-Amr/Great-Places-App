import 'package:flutter/material.dart';
import 'package:great_apps/screens/places_list.dart';
import 'package:provider/provider.dart';

import 'providers/greatPlaces.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Great Places',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(),
        ),
        home: MyPlacesListScreen(),
      ),
    );
  }
}
