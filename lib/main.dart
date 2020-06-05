import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import './dustman_bloc.dart';

import 'ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<DustmanBloc>(
        create: (context) => DustmanBloc(),
        child: HomePage( title: 'Dustman Game' ),
      ),
    );
  }
}