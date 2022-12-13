import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appbar',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/SendMail',
              );
            },
            icon: const Icon(
              Icons.email,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/ReceviedMail',
              );
            },
            icon: const Icon(
              Icons.email_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/SendMail',
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/ReceviedMail',
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
