

//todo que se le pueda asignar el color a cada tarjeta to-do
//todo que el titulo asignado sea el valor que se ve en la tarjeta
//todo que la tarjeta tenga la fecha en la que se creo
//todo que la tarjeta tenga un icono para editar
//todo que la tarjeta tenga un icono para eliminar
//? se podria hacer que la tarjeta se cree a partir de un calendario

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pruebamia/screens/pages/new_todo.dart';
import 'package:pruebamia/presentation/widgets/model/todo_model.dart';
import 'package:pruebamia/screens/pages/todo_details_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To-Do App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 32, 32),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Consumer<TodoModel>(
          builder: (context, todoModel, child) {
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
              ),
              children: todoModel.todoCards.map((todoCard) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodoDetailsPage(todoCard: todoCard)),
                  );
                },
                child: todoCard,
              )).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewTodoPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}