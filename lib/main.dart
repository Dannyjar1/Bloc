import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ejemplobloc/bloc/habitos/habitos_bloc.dart';
import 'package:ejemplobloc/bloc/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Seguimiento de Hábitos',
      home: BlocProvider(
        create: (context) => HabitosBloc(),
        child: HomeScreen(),
      ),
    );
  }
}