import 'package:flutter/material.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/views/user_detail_page.dart';

class UsersListItem extends StatelessWidget {
  User user;

  UsersListItem(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: Colors.black
      ),
      subtitleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.blue
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(user.email),
          const SizedBox(height: 2),
          Text(user.website)
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDetailPage(userId: user.id))
        );
      },
    );
  }
}