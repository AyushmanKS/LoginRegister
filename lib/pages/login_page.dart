import 'package:flutter/material.dart';
import 'package:login_register/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool isLoginActive = false;

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
                                      setState(() {
                                        isLoginActive = true;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: isLoginActive ? Colors.white : Colors.transparent,
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
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      // Navigate to sign up page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupPage()),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: isLoginActive ? Colors.transparent : Colors.white,
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
                                                color: Color(0xFF6a7b8c)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 28),

                          // Email Text field
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'E-mail ID',
                              hintStyle: TextStyle(color: Color(0xFF6a7b8c)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xFF2863eb),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Password Text field
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Color(0xFF6a7b8c)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                color: Color(0xFF2863eb),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        const Color(0xFF2863EB)),
                                child: Checkbox(
                                  value: isChecked,
                                  activeColor: const Color(0xFF2863EB),
                                  checkColor: Colors.white,
                                  side: const BorderSide(
                                      color: Color(0xFF2863EB), width: 2),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const Text('Remember me'),
                              const Spacer(),
                              const Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: Color(0xFF2863eb),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),

                          const SizedBox(height: 12),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 13.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2863eb),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500),
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
                                  'Or login with',
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
