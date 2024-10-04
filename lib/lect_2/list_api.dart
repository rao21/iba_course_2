import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class PostListUser extends StatefulWidget {
  const PostListUser({super.key});

  @override
  State<PostListUser> createState() => _PostListUserState();
}

class _PostListUserState extends State<PostListUser> {
   
   Future<List<Post>> fetchAllPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
     if (response.statusCode == 200) {
       List jsonResponse = jsonDecode(response.body);
       return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(future: fetchAllPosts(), 
        builder: (context,snap){
          
          if(snap.hasData){
            
            return ListView.builder(itemBuilder: (c,i){
              var _item = snap.data![i];
              return ListTile(title: Text(_item.title),subtitle: Text(_item.content),
              leading: CircleAvatar(child: Image.network(_item.image),),
              );
            });
          }
          else if(snap.hasError){
            return Text('error in fetch');
          }
          return CircularProgressIndicator();
        }),
      ),
    );
  }
}

class Post {
  final int id;
  final String slug;
  final String url;
  final String title;
  final String content;
  final String image;

  Post({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      slug: json['slug'],
      url: json['url'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'url': url,
      'title': title,
      'content': content,
      'image': image,
    };
  }
}
