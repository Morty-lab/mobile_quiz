import 'package:flutter/material.dart';
import 'package:mobile2/components/addUserForm.dart';
import 'package:mobile2/components/navItem.dart';
import 'package:mobile2/models/friendsModel.dart';
import 'package:mobile2/models/userModel.dart';
import 'package:mobile2/pages/friends.dart';

import 'package:mobile2/pages/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Friends>>(
        future: getFriends(), // Call the getFriends function here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator while waiting
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading friends')); // Handle error state
          } else {
            List<Friends> friendlist = snapshot.data ?? []; // Get the list of friends

            List<Widget> navItems = friendlist.map((friend) => NavItem(title: friend.name ?? '', friend: friend,)).toList();

            // Update the drawer with the dynamically generated navigation items
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Mobile 2 ITSD82",
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use a clean, minimalist font
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 // Light background for minimalistic look
                elevation: 0.0, // Remove shadow for a more minimalistic feel

              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(main_user.name),
                      accountEmail: Text(main_user.email),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                          main_user.image,
                        ),
                      ),
                      onDetailsPressed: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(user: main_user,friendlist: friendlist,),
                          ),
                        );
                      },
                      decoration: BoxDecoration(
                        color: Colors.black12,
                      ),
                    ),
                    ...navItems, // Spread the list of navigation items
                  ],
                ),
              ),
              body: Center(
                child: ListView.builder(
                  itemCount: friendlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(friendlist[index].image ?? ''),
                        ),
                        title: Text(
                          friendlist[index].name ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(friendlist[index].email ?? ''),
                            SizedBox(height: 5),
                            Text(friendlist[index].age.toString() ?? ''),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FriendsPage(friend: friendlist[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
                ,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddUserForm()),
                  );
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.black12,
              ),
            );
          }
        },
      ),
    );
  }
}
