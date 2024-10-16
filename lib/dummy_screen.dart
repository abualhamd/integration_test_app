import 'package:flutter/material.dart';
import 'package:integration_test_app/home_screen.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                validator: (value) {
                  if (value?.isEmpty ?? true) return "Field can't be empty";
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  }

                },
                child: const Text('navigate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
