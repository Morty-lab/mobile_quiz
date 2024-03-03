import 'package:flutter/material.dart';
import 'package:mobile2/models/friendsModel.dart';
import 'package:mobile2/pages/friends.dart';

class NavItem extends StatelessWidget {
  final String title;
  final Friends friend;
  const NavItem({super.key, required this.title, required this.friend});


  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(title),
      onTap: () {
        // Navigate to Home page
        Navigator.pop(context); // Close the drawer
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FriendsPage(friend: friend),
          ),
        );
      },
    );
  }
}
