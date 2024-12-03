import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iba_course_2/friends/add.dart';

class FriendsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Friends List"),actions: [
        IconButton(onPressed: (){
           Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  AddFriendScreen(),
    ),
  );
        }, icon: Icon(Icons.add))
      ],),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('friends').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final friends = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              final friend = friends[index];
              final name = friend['name'];
              final email = friend['email'];

              return ListTile(
                title: Text(name),
                subtitle: Text(email),
                trailing: IconButton(onPressed: (){
                    FirebaseFirestore.instance.collection('friends');
                }, icon:const Icon(Icons.delete)),
              );
            },
          );
        },
      ),
    );
  }
}
