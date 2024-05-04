import 'package:chat_application/component/button_component.dart';
import 'package:chat_application/component/row_component.dart';
import 'package:chat_application/component/show_snackbar.dart';
import 'package:chat_application/component/textfield_component.dart';
import 'package:chat_application/screens/chat_page.dart';
import 'package:chat_application/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static String id2 = 'SignIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email, password;
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: Colors.purple,
      ),
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const CircleAvatar(
                  radius: 60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/WhatsApp Image 2024-05-03 at 20.05.16.jpeg',
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'welcome back',
                      style: TextStyle(
                          color: Colors.purple,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldComponent(
                  text: 'Email',
                  icon: const Icon(Icons.email),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldComponent(
                  obscureText: true,
                  text: 'Password',
                  icon: const Icon(Icons.password),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonComponent(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        loading = true;
                        setState(() {});
                        try {
                          await signInUser();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, ChatPage.id3,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          showSnackBar(context, 'there was an error');
                        }
                        loading = false;
                        setState(() {});
                      } else {}
                    },
                    message: 'Sign In'),
                const SizedBox(
                  height: 10,
                ),
                RowComponent(
                  newText: 'Don\'t have an account?',
                  text1: '    Sign Up',
                  onTap: () {
                    Navigator.pushNamed(context, SignUp.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    // ignore: unused_local_variable
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
