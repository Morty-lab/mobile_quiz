import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile2/models/friendsModel.dart';
import 'package:mobile2/pages/home.dart';

class AddUserForm extends StatefulWidget {
  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();

  // Variables to hold the form field values
  String _email = '';
  String _name = '';
  String _image = '';
  int _age =  0;

  @override
  Widget build(BuildContext context) {
    CollectionReference friends = FirebaseFirestore.instance.collection('friends');

    Future<void> addUser(Friends friend) async {
      try {
        await friends
            .add({

          'name': friend.name,
          'email': friend.email,
          'age': friend.age,
          "image": friend.image,
        })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      } catch (e) {
        print("An error occurred while adding the user: $e");
        // Handle the error appropriately, e.g., show a dialog or a snackbar
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Email Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              // Name Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              // Image Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _image = value!;
                },
              ),
              // Age Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = int.parse(value!);
                },
              ),
              // Submit Button
              SizedBox(height:  20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    Friends friend = Friends(email: _email, name: _name, image: _image, age: _age);
                    await addUser(friend);
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
