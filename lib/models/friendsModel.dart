import 'package:cloud_firestore/cloud_firestore.dart';

class Friends {
  Friends({
    this.id,
    this.name,
    this.email,
    this.age,
    this.image,
  });
 final String? id;
  final String? name;
  final String? email;
  final int? age;
  final String? image;

  // Method to convert a Map into a Friends object
  factory Friends.fromMap(Map<String, dynamic> data, id) {
    return Friends(
      id: id,
      name: data['name'],
      email: data['email'],
      age: data['age'],
      image: data['image'],
    );
  }
}

Future<List<Friends>> getFriends() async {
  CollectionReference friendsCollection = FirebaseFirestore.instance.collection('friends');

  // Fetching the documents
  QuerySnapshot querySnapshot = await friendsCollection.get();

  // Converting the documents to Friends objects
  List<Friends> friendlist = querySnapshot.docs.map((doc) => Friends.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();

  return friendlist;

}
