import 'package:chat_application/component/chat_bubble.dart';
import 'package:chat_application/model/chat_page_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id3 = 'ChatPage';
  ScrollController newController = ScrollController();
  TextEditingController controller = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('messages');
  @override
  Widget build(BuildContext context) {
    var email=ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: users.orderBy('datenow',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ChatPageModel> chatList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              chatList.add(ChatPageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title:const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'assets/images/WhatsApp Image 2024-05-03 at 20.05.16.jpeg',
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 10),
                      child: Text(
                        'Mostafa',
                        style: TextStyle(
                            //fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                        reverse: true,
                        physics:const BouncingScrollPhysics(),
                          controller: newController,
                          itemCount: chatList.length,
                          itemBuilder: ((context, index) {
                            return chatList[index].id==email? ChatBubble(
                              chatPageModel: chatList[index],
                            ):ChatFreindBubble(chatPageModel: chatList[index],);
                          }))),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        users
                            .add({'message': value, 'datenow': DateTime.now(),
                            'id':email
                            });
                        controller.clear();
                        newController.animateTo(
                            0,
                            duration:const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      style:const TextStyle(color: Colors.purple),
                      decoration: InputDecoration(
                        fillColor: Colors.purple.withOpacity(0.2),
                        filled: true,
                        suffixIcon:const Icon(Icons.send),
                        suffixIconColor: Colors.purple,
                        hintText: 'Send Message',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:const BorderSide(color: Colors.purple)),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Text('Loading...');
          }
        });
  }
}
