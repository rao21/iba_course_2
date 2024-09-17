import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar({super.key});

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('https://images.pexels.com/photos/28243686/pexels-photo-28243686/free-photo-of-a-cat-is-walking-on-a-pier.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load'),
        ElevatedButton(onPressed: (){
               final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: const Text('Lecture 2 Snack bar!'),
                action: SnackBarAction(
                  label: 'Reload',
                  onPressed: () {},
                ),
              );  
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
        }, child: const Text('Show snack')),
      ],
    );
  }
}