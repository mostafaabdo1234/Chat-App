import 'package:chat_application/model/chat_page_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key, required this.chatPageModel,
  });
  final ChatPageModel chatPageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        padding:const EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 16),
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Colors.purple
        ),
        child: Text(chatPageModel.texts,
        style:const TextStyle(
          color: Colors.white
        ),
        ),
      ),
    );
  }
}


class ChatFreindBubble extends StatelessWidget {
  const ChatFreindBubble({
    super.key, required this.chatPageModel,
  });
  final ChatPageModel chatPageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        padding:const EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 16),
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color.fromARGB(255, 77, 9, 88)
        ),
        child: Text(chatPageModel.texts,
        style:const TextStyle(
          color: Colors.white
        ),
        ),
      ),
    );
  }
}