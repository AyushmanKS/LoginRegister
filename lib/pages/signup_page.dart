import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register/components/custom_text_field.dart';
import 'package:login_register/pages/home_page.dart';
import 'package:login_register/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isChecked = false;

  String email = "";
  String password = "";
  String name = "";

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  // register new acount
  registration() async {
    if (password != null &&
        password.length < 6 &&
        email != null &&
        name != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Registered Successfuly",
                style: TextStyle(fontSize: 20))));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      email: email,
                      password: password,
                    )));
      } catch (e) {
        String errorMessage = "Registration failed";

        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'email-already-in-use':
              errorMessage = "This email is already in use.";
              break;
            case 'invalid-email':
              errorMessage = "The email address is not valid.";
              break;
            case 'operation-not-allowed':
              errorMessage = "Email/password accounts are not enabled.";
              break;
            case 'weak-password':
              errorMessage = "The password is too weak.";
              break;
            default:
              errorMessage = "Credentials are empty or undefined.";
          }
        } else {
          errorMessage = "An error occurred: ${e.toString()}";
        }

        print('Error in registration: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMessage, style: const TextStyle(fontSize: 14))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              colors: [
                Color(0xFF253143),
                Color(0xFF172133),
                Color(0xFF10182a),
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF2863eb),
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: BackButton(
                          color: Colors.white,
                          onPressed: null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Text('Go ahead and set up \nyour account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Sign in-up to enjoy the best managing experience',
                        style: TextStyle(
                            color: Color(0xFF8190a4),
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28, right: 28, top: 32),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFe2e8f0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigate to login page
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: Colors.transparent,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF6a7b8c)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                            color: Colors.transparent,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Register',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),

                          const SizedBox(height: 28),

                          // Name Text field
                          CustomTextField(
                            hintText: 'Name',
                            icon: const Icon(
                              Icons.person,
                              color: Color(0xFF2863eb),
                            ),
                            secureText: false,
                            controller: nameController,
                          ),

                          const SizedBox(height: 20),

                          // Email Text field
                          CustomTextField(
                            hintText: 'E-mail ID',
                            icon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFF2863eb),
                            ),
                            secureText: false,
                            controller: emailController,
                          ),

                          const SizedBox(height: 20),

                          // Password Text field
                          CustomTextField(
                            hintText: 'Password',
                            icon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF2863eb),
                            ),
                            secureText: true,
                            controller: passwordController,
                          ),

                          const SizedBox(height: 15),

                          // Register button
                          InkWell(
                            onTap: () {
                              setState(() {
                                name = nameController.text;
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              registration();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13.0, horizontal: 30.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2863eb),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 25),

                          const Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Or register using',
                                  style: TextStyle(color: Color(0xFF6a7b8c)),
                                ),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          const SizedBox(height: 30),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: const Color(0xFFe2e8f0),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/google_logo.png',
                                        height:
                                            30, // Adjust image size if needed
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Google',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF6a7b8c)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: const Color(0xFFe2e8f0),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/apple_logo.png',
                                        height: 26,
                                        // Adjust image size if needed
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Apple',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF6a7b8c)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
