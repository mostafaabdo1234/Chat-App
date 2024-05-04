class ChatPageModel {
  final String texts;
  final String id;
  const ChatPageModel(this.texts,this.id);
  factory ChatPageModel.fromJson(json) {
    return ChatPageModel(json['message'],json['id']);
  }
}
