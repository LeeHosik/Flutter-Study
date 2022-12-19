import 'package:flutter/material.dart';

//import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List View',
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/Insert2'),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
