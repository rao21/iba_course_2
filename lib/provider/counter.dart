import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iba_course_2/lect_2/list_api.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}
class Counter with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  int get postLength => _posts.length;

  void fetchPost() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
     if (response.statusCode == 200) {
       List jsonResponse = jsonDecode(response.body);
       _posts = jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body:  Center(
        child: ListView.builder(
          itemCount: context.watch<Counter>().postLength,
          itemBuilder: (cxt,i){
             var _item = context.watch<Counter>().posts[i];
            return ListTile(title: Text(_item.title),subtitle: Text(_item.content),
              leading: CircleAvatar(child: Image.network(_item.image),),
              );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),
        onPressed: () => context.read<Counter>().fetchPost(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().posts}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}