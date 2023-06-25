import 'package:fitbit/config/router/app_route.dart';
import 'package:fitbit/config/themes/app_color_constant.dart';
import 'package:fitbit/core/common/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  var gap = const SizedBox(
    height: 20,
  );

  bool obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

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
                            children: [
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'to',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: AppColorConstant.secondaryColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Fit',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(222, 229, 145, 55),
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Bit ',
                                      style: TextStyle(
                                        color: Color.fromARGB(180, 154, 42, 38),
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
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
                                  text: 'Sign in to your',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.grey,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' FITBIT Account ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
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
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    gap,
                    Container(
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColorConstant.primaryColor,
                        ),
                      ),
                    ),
                    gap,
                    gap,
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.dashboardRoute);
                        },
                        child: const Text(
                          'LOGIN',
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
                      'New User?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.registerRoute);
                      },
                      child: const Text(
                        "CREATE AN ACCOUNT",
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
