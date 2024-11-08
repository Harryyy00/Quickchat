import 'package:flutter/material.dart';

class ConversationItemWidget extends StatelessWidget {
  const ConversationItemWidget({
    super.key,
    required this.profilePicBlob,
    required this.lastMessage,
    required this.userName,
    required this.timeStamp,
    required this.onTap,
  });

  final String profilePicBlob;
  final String lastMessage;
  final String userName;
  final String timeStamp;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Text(
            userName.split('')[0].toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          userName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          lastMessage,
          style: const TextStyle(color: Colors.grey),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Text(timeStamp),
      ),
    );
  }
}
