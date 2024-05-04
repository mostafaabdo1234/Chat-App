import 'package:chat_application/screens/chat_page.dart';
import 'package:chat_application/screens/sign_in.dart';
import 'package:chat_application/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Application',
      routes: {
        SignIn.id2:(context) =>const SignIn(),
        SignUp.id:(context) =>const SignUp(),
        ChatPage.id3:(context) => ChatPage()
      },
      initialRoute: SignIn.id2,
    );
  }
}