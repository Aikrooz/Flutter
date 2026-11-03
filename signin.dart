import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();
  bool hidden = true;

  InputDecoration field(String hint, {Widget? suffix}) => InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFFEFF4FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/logo.jpeg'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text('Create Portal Account',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                  const Center(child: Text('Register using your school email')),
                  const SizedBox(height: 24),
                  const Text('Student Name'),
                  const SizedBox(height: 6),
                  TextField(controller: name, decoration: field('e.g. Eleanor Vance')),
                  const SizedBox(height: 16),
                  const Text('School Email Address'),
                  const SizedBox(height: 6),
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: field('student@newbeacon.edu'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Create Password'),
                  const SizedBox(height: 6),
                  TextField(
                    controller: password,
                    obscureText: hidden,
                    decoration: field(
                      '••••••••••••',
                      suffix: IconButton(
                        icon: Icon(hidden ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => hidden = !hidden),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Confirm Password'),
                  const SizedBox(height: 6),
                  TextField(
                    controller: confirm,
                    obscureText: true,
                    decoration: field('••••••••••••'),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        // TODO: register with name.text, email.text, password.text
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF8D4B00),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('Create School Account'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Already have an account? Sign In'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}