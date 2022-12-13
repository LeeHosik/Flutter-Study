import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // drawer 위에 흰 부분 다 챙겨가는거
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/sense.jpeg',
                ),
              ),
              accountName: Text(
                'SR 이순신 장군',
              ),
              accountEmail: Text(
                'Lee Sun Shin@Josen.com',
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
                  '/SendMail',
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
                  '/ReceviedMail',
                );
              },
              // trailing: const Icon(Icons.settings),
            ),
          ],
        ),
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
              child: const Text(
                '보낸 편지함',
              ),
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
              child: const Text(
                '받은 편지함',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
