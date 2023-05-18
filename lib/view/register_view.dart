import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String gender = 'Male';

  void handleGenderChange(String value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Age',
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                RadioListTile(
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) => handleGenderChange('Male'),
                ),
                RadioListTile(
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) => handleGenderChange('Female'),
                ),
                RadioListTile(
                  title: const Text('Others'),
                  value: 'Others',
                  groupValue: gender,
                  onChanged: (value) => handleGenderChange('Others'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
