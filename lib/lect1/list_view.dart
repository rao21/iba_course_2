import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});

  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body:  ListView.separated(
        itemCount: 14,
        separatorBuilder: (context,index) => const Divider(color: Colors.grey,thickness: 0.5,),
        itemBuilder: (context,index) =>  ListTile(
            leading:  CircleAvatar(
              child: Text(index.toString()),
            ),
            title: const Text('Intro Flutter widgets '),
            subtitle: const Text('Read more about FLutter widget'),
            trailing: const Icon(Icons.remove_red_eye),
          ),
      ),
    );
  }
}
