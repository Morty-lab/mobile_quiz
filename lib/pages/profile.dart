import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile2/models/friendsModel.dart';
import 'package:mobile2/models/userModel.dart';
import 'package:mobile2/pages/friends.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final List<Friends> friendlist;
  const ProfilePage({super.key, required this.user, required this.friendlist});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
       // Set a background color for the entire page
      body: Center(
        child: Column(
          children: <Widget>[
            // Profile picture
            Container(
              height: 100.0,
              width: 100.0,
              margin: EdgeInsets.only(bottom: 20.0), // Add some space below the profile picture
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.image), // Assuming the image is a URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // User details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Age: ${user.age}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            // List of friends
            Flexible(
              child: GridView.builder(
                itemCount: friendlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of items per row as needed
                  childAspectRatio: 1, // Adjust based on your desired aspect ratio
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendsPage(friend: friendlist[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100, // Adjust the height as needed
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(friendlist[index].image!), // Assuming friendlist[index] has an imageUrl field
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              friendlist[index].name!,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )


            ),
            // Footer
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Total Friends: ${friendlist.length - 1}', // Exclude the main user
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );


  }
}
