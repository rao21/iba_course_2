import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFriendScreen extends StatefulWidget {
  @override
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> addFriend() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      FirebaseFirestore.instance.collection('friends').add({
        'name': name,
        'email': email,
      });
       nameController.clear();
      emailController.clear();
      Navigator.of(context).pop();
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Friend")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Friend's Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Friend's Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addFriend,
              child: Text("Add Friend"),
            ),
          ],
        ),
      ),
    );
  }
}
