import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drawer',
        ),
        actions: [
          IconButton(
            onPressed: () {
              print(
                'shopping cart is clicked.',
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {
              print(
                'shopping cart is clicked.',
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // drawer 위에 흰 부분 다 챙겨가는거
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/pika1.png',
                ),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pika2.png',
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pika3.png',
                  ),
                ),
              ],
              accountName: Text(
                'Luche Sia',
              ),
              accountEmail: Text(
                'tj0bigdata0l@gmail.com',
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                //borderRadius: BorderRadius.circular(110), // 아마 맥시멈 110
                // 위에 꺼는 4각 전부 다 깍아서 위에부분이 이상하게 보임
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text('Setting'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
