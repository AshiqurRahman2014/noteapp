import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:node_app/controller/auth_controller.dart';
import 'package:node_app/pages/home_screen.dart';

class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool circular = false;
  //AuthClass authClass = AuthClass();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text.trim();
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();

                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  Get.snackbar('Error', 'Please fill all fields',
                      snackPosition: SnackPosition.BOTTOM);
                  return;
                }
                try {
                  await _authController.register(email, password, name);
                } catch (e) {
                  Get.snackbar('Registration Error', e.toString(),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
