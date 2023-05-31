import 'package:fitbit/routes/app_route.dart';
import 'package:fitbit/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final usernameController = TextEditingController(text: '');
  final firstnameController = TextEditingController(text: '');
  final lastnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final confirmPasswordController = TextEditingController(text: '');
  final ageController = TextEditingController(text: '');
  final genderController = TextEditingController(text: '');

  String gender = 'Male';

  void handleGenderChange(String value) {
    setState(() {
      gender = value;
    });
  }

  bool obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  var gap = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: const [
                              Text(
                                'Create FITBIT Account',
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        gap,
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'Sign up to get started',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    gap,
                    customTextField(usernameController, 'Username'),
                    gap,
                    customTextField(firstnameController, 'First Name'),
                    gap,
                    customTextField(lastnameController, 'Last Name'),
                    gap,
                    customTextField(emailController, 'Email'),
                    gap,
                    TextFormField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: togglePasswordVisibility,
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    gap,
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: togglePasswordVisibility,
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    gap,
                    customTextField(ageController, 'Age'),
                    gap,
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    RadioListTile(
                      title: const Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) => handleGenderChange('Male'),
                    ),
                    RadioListTile(
                      title: const Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) => handleGenderChange('Female'),
                    ),
                    RadioListTile(
                      title: const Text(
                        'Others',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      value: 'Others',
                      groupValue: gender,
                      onChanged: (value) => handleGenderChange('Others'),
                    ),
                    gap,
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'CREATE FITBIT ACCOUNT',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    gap,
                    gap,
                    const Text(
                      'Already have an Account?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 62, 62, 62),
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.loginRoute);
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
