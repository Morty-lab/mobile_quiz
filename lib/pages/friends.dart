import 'package:flutter/material.dart';
import 'package:mobile2/models/friendsModel.dart';

class FriendsPage extends StatelessWidget {
  final Friends friend;
  FriendsPage({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(friend.name!),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Profile picture
            Container(
              height:  100.0,
              width:  100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(friend.image!), // Assuming the image is a URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Name
            Text(
              friend.name!,
              style: TextStyle(fontSize:  24, fontWeight: FontWeight.bold),
            ),
            // Email
            Text(
              friend.email!,
              style: TextStyle(fontSize:  18),
            ),
            // Age
            Text(
              'Age: ${friend.age}',
              style: TextStyle(fontSize:  18),
            ),

          ],
        ),
      ),
    );
  }
}
