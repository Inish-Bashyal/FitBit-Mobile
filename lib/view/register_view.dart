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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 110, 110),
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: const Color.fromARGB(255, 183, 168, 168).withOpacity(0.4),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customTextField(usernameController, 'Username'),
                      const SizedBox(height: 20.0),
                      customTextField(firstnameController, 'First Name'),
                      const SizedBox(height: 20.0),
                      customTextField(lastnameController, 'Last name'),
                      const SizedBox(height: 20.0),
                      customTextField(emailController, 'Email'),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: passwordController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 208, 190, 190),
                          suffixIcon: GestureDetector(
                            onTap: togglePasswordVisibility,
                            child: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 208, 190, 190),
                          suffixIcon: GestureDetector(
                            onTap: togglePasswordVisibility,
                            child: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      customTextField(ageController, 'Age'),
                      const SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 226, 215, 215),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      RadioListTile(
                        title: const Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 226, 215, 215),
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
                            color: Color.fromARGB(255, 226, 215, 215),
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
                            color: Color.fromARGB(255, 226, 215, 215),
                          ),
                        ),
                        value: 'Others',
                        groupValue: gender,
                        onChanged: (value) => handleGenderChange('Others'),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
