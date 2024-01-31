import 'package:ejemplobloc/bloc/model/habito.dart';

abstract class HabitosState {}

class HabitosInitial extends HabitosState {}

class HabitosLoaded extends HabitosState {
  final List<Habito> habitos;

  HabitosLoaded(this.habitos);
}
