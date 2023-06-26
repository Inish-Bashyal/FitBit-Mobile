import 'package:fitbit/config/router/app_route.dart';
import 'package:fitbit/core/common/snackbar/my_snackbar.dart';
import 'package:fitbit/core/common/widgets/textfield_widget.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final usernameController = TextEditingController(text: '');
  final firstnameController = TextEditingController(text: '');
  final lastnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final confirmPasswordController = TextEditingController(text: '');
  final ageController = TextEditingController(text: '');
  final genderController = TextEditingController(text: '');
  final key = GlobalKey<FormState>();

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
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: key,
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
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            var user = UserEntity(
                              firstname: firstnameController.text,
                              lastname: lastnameController.text,
                              email: emailController.text,
                              username: usernameController.text,
                              password: passwordController.text,
                              age: ageController.text,
                              gender: gender,
                            );

                            ref
                                .read(authViewModelProvider.notifier)
                                .registerUser(user);

                            if (authState.error != null) {
                              showSnackBar(
                                message: authState.error.toString(),
                                context: context,
                                color: Colors.red,
                              );
                            } else {
                              showSnackBar(
                                message: 'Registered successfully',
                                context: context,
                              );
                            }
                          }
                        },
                        child: const Text('Register'),
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
