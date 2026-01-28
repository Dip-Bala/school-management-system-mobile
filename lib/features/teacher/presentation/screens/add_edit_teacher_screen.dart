import 'package:flutter/material.dart';

class AddEditTeacherScreen extends StatelessWidget {
  const AddEditTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Teacher')),
      body: const Center(child: Text('Add/Edit Teacher Form')),
    );
  }
}
