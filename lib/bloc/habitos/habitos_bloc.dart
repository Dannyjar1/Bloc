
import 'package:ejemplobloc/bloc/model/habito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ejemplobloc/bloc/habitos/habitos_event.dart';
import 'package:ejemplobloc/bloc/habitos/habitos_state.dart';




class HabitosBloc extends Bloc<HabitosEvent, HabitosState> {
  List<Habito> habitos = [];

  HabitosBloc() : super(HabitosInitial()) {
    on<AddHabito>((event, emit) {
      habitos.add(event.habito);
      emit(HabitosLoaded(habitos));
    });

    on<DeleteHabito>((event, emit) {
      habitos.removeWhere((habito) => habito.id == event.habitoId);
      emit(HabitosLoaded(habitos));
    });
  }
}