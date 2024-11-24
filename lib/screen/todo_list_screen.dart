import 'package:class_project/screen/add_new_todo_screen.dart';
import 'package:class_project/screen/update_todo_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewTodoScreen(),
                ));
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                   builder: (context) => const UpdateTodoListScreen()
                    ));
                },
              title: Text('Title of Todo '),
              leading: Text('status'),
              subtitle: Text('Description'),
              trailing: Wrap(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  IconButton(
                      onPressed: _showChangeStatusDialog,
                      icon: Icon(Icons.edit)),
                ],
              ),
            );
          },
        ));
  }

  void _showChangeStatusDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Idle'),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                title: Text('In progress'),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                title: Text('Done'),
              ),
            ],
          ),
        );
      },
    );
  }
} // end _TodoListScreenState
