import 'dart:developer';

import 'package:englis_only/dB/db.dart';
import 'package:englis_only/functions/HiveFunctions.dart';
import 'package:englis_only/functions/classFunctoins.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final Box<StudentModel> studentBox = getStudentBox();
    TextEditingController textEditingController = TextEditingController();
    List<StudentModel> StudentList = studentBox.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: (() {
                //shareing to whatsapp
              }),
              icon: Icon(Icons.share))
        ],
      ),
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: studentBox.listenable(),
        builder: (context, Box<StudentModel> StudentModel, child) {
          return studentBox.isEmpty
              ? const Center(
                  child: Text('Add Students'),
                )
              : ListView.builder(
                  itemCount: StudentList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.lightBlue,
                      child: GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete Student'),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        AddStudentFunction.deleteStudent(
                                            UserName: StudentList[index].name);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                      )),
                                ],
                              );
                            },
                          );
                        },
                        child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                              StudentList[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  StudentList[index].count.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                IconButton(
                                    onPressed: () {
                                      log('Plus button clicked');
                                      StudentCounnting.Increment(
                                          count: StudentList[index].count,
                                          UserName: StudentList[index].name);
                                    },
                                    icon: Icon(Icons.add)),
                              ],
                            )),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 30,
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add New User'),
                  content: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Name';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text('Enter Username')),
                      controller: textEditingController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          log(textEditingController.text);
                          if (_formKey.currentState!.validate()) {
                            AddStudentFunction.addStudent(
                                UserName: textEditingController.text.trim(),
                                context: context);
                          }
                        },
                        child: Text('ADD USER')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('CANCEL')),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
