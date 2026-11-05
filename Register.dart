
import 'package:flutter/material.dart';

void main() {
  runApp(const NewBeaconApp());
}

class NewBeaconApp extends StatelessWidget {
  const NewBeaconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool hidden = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  InputDecoration field(String hint, {Widget? suffix}) =>
      InputDecoration(
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
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/logo.jpeg'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'New Beacon International School',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Sign in with your school email to access your student portal.',
                  ),

                  const SizedBox(height: 16),

                  const Text('School Email Address'),
                  const SizedBox(height: 6),

                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: field('e.g. user@newbeacon.edu'),
                  ),

                  const SizedBox(height: 16),

                  const Text('Password'),
                  const SizedBox(height: 6),

                  TextField(
                    controller: password,
                    obscureText: hidden,
                    decoration: field(
                      '••••••••••••',
                      suffix: IconButton(
                        icon: Icon(
                          hidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidden = !hidden;
                          });
                        },
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (email.text.trim().isEmpty ||
                            password.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter your email and password',
                              ),
                            ),
                          );
                          return;
                        }

                        // Add authentication logic here.
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF4059AA),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('Sign In to Portal'),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'New to New Beacon? Create an Account / Register',
                        textAlign: TextAlign.center,
                      ),
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
