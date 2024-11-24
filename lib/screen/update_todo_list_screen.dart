import 'package:flutter/material.dart';

class UpdateTodoListScreen extends StatefulWidget {
  const UpdateTodoListScreen({super.key});

  @override
  State<UpdateTodoListScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<UpdateTodoListScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleTEController = TextEditingController();
  final  TextEditingController desTEController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo list'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: titleTEController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Write your Title here';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: desTEController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Write your description here';
                        }
                        return null;
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate());
              }, child: const Text('Add')),
            )
            
          ],
        ),
      ),
    );
  }
}
