import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatConverstaion {
  final types.User user;
  final String userAvatar;
  final String lastMessage;

  ChatConverstaion(
      {required this.user,
      required this.lastMessage,
      required this.userAvatar});
}
