import 'package:ejemplobloc/bloc/model/habito.dart';

// abstract class HabitosEvent {}

// class HabitoAdded extends HabitosEvent {
//   final Habito habito;

//   HabitoAdded(this.habito);
// }


abstract class HabitosEvent {}

class AddHabito extends HabitosEvent {
  final Habito habito;

  AddHabito(this.habito);
}

class DeleteHabito extends HabitosEvent {
  final String habitoId;
  DeleteHabito(this.habitoId);
}