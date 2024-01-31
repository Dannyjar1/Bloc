
import 'package:ejemplobloc/bloc/habitos/habitos_event.dart';
import 'package:ejemplobloc/bloc/model/habito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ejemplobloc/bloc/habitos/habitos_bloc.dart';
import 'package:ejemplobloc/bloc/habitos/habitos_state.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguimiento de Hábitos'),
      ),
      body: Center(
        child: BlocBuilder<HabitosBloc, HabitosState>(
          builder: (context, state) {
            if (state is HabitosInitial) {
              return Text('No hay hábitos aún.');
            } else if (state is HabitosLoaded) {
              return ListView.builder(
                itemCount: state.habitos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.habitos[index].nombre),
                    subtitle: Text(state.habitos[index].descripcion),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final habito = Habito(id: '1', nombre: 'Leer', descripcion: 'Leer 30 minutos al día');
          context.read<HabitosBloc>().add(AddHabito(habito));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}