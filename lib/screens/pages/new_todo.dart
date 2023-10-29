import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamia/presentation/widgets/model/todo_model.dart';
class NewTodoPage extends StatefulWidget {
  const NewTodoPage({Key? key}) : super(key: key);
  @override
  NewTodoPageState createState() => NewTodoPageState();
}
class NewTodoPageState extends State<NewTodoPage> {
  final TextEditingController _titleController = TextEditingController();
  //inicia con un TextEditingController
  //final List<TextEditingController> _todosControllers = [TextEditingController()];
  final List<TextEditingController> _todosControllers = []; // Inicia como lista vacía
  @override
  Widget build(BuildContext context) {
    // Obtén la instancia de TodoModel
    TodoModel todoModel = Provider.of<TodoModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New To-Do List'),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Enter the title',
                ),
                
              onSubmitted: (value) {
    // Aquí puedes manejar la lógica para guardar el nuevo To Do
    List<String> taskNames = _todosControllers.map((controller) => controller.text).toList();
    if (value.isEmpty || taskNames.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter a title and at least one task'),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
    );
  } else if (_titleController.text.length > 40) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Title cannot be more than 40 characters'),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    todoModel.createTodoCard(_titleController.text, taskNames);
    Navigator.pop(context);
    if (kDebugMode) {
      print('New To Do created with title ${_titleController.text} and tasks $taskNames');
    }
  }
},
              ),  
              ..._todosControllers
                  .map((controller) => ListTile(
                        leading: const Icon(Icons.fiber_manual_record,
                            size: 20),
                        title: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            hintText: 'Enter the task',
                          ),
                        ),
                      ))
                  .toList(),
            ],
          ),
          Positioned(
            bottom: 150.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'homeButton',
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
          Positioned(
            bottom: 80.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'addButton',
              onPressed: () async {
                // Muestra un cuadro de diálogo para ingresar la tarea
                String? task = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                     String? task;
                    return AlertDialog(
                      title: const Text('Enter the task'),
                      content: TextField(
                          onChanged: (value) {
                        task = value;
                          }
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('+Add'),
                          onPressed: () {
                            Navigator.of(context).pop(task);
                          },
                        ),
                      ],
                    );
                  },
                );
                if (task != null) {
                  // Agrega un nuevo TextEditingController con el texto ingresado
                  setState(() {
                    _todosControllers.add(TextEditingController(text: task));
                  });
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'saveButton',
            onPressed: () {
  List<String> taskNames = _todosControllers.map((controller) => controller.text).toList();
  if (_titleController.text.isEmpty || taskNames.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter a title and at least one task'),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else if (_titleController.text.length > 40) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Title cannot be more than 40 characters'),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    todoModel.createTodoCard(_titleController.text, taskNames);
    Navigator.pop(context);
    if (kDebugMode) {
      print('New To Do created with title ${_titleController.text} and tasks $taskNames');
    }
  }
},

              child: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
