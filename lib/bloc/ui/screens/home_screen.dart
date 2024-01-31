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
        onPressed: () => _showAddHabitoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddHabitoDialog(BuildContext context) {
    String nombre = '';
    String descripcion = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Nuevo Hábito'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) => nombre = value,
                decoration: InputDecoration(labelText: 'Nombre del Hábito'),
              ),
              TextField(
                onChanged: (value) => descripcion = value,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                if (nombre.isNotEmpty && descripcion.isNotEmpty) {
                  final habito = Habito(
                    id: DateTime.now().toString(), // Generar un ID único
                    nombre: nombre,
                    descripcion: descripcion,
                  );
                  context.read<HabitosBloc>().add(AddHabito(habito));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

