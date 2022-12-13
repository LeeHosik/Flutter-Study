import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/nullPage',
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
                '/nullPage',
              );
            },
            icon: const Icon(
              Icons.add,
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
                  'images/kitasan.jpeg',
                ),
              ),
              accountName: Text(
                '3Star Kitasan Black',
              ),
              accountEmail: Text(
                'kitasanblack@umamusume.com',
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
                Icons.mail,
                color: Colors.blue,
              ),
              title: const Text('보낸 편지함'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/nullPage',
                );
              },
              //trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/nullPage',
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic1day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '01 Day',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic2day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '02 Day',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
