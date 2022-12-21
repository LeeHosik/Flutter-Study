import 'package:flutter/material.dart';

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
                '/chkList',
              );
            },
            icon: const Icon(
              Icons.check,
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
              title: const Text('Test'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/TEST_LIst',
                );
              },
              //trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: const Text('Check List'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/chkList',
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
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic3day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '03 Day',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic4day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '04 Day',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic5day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '05 Day',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic6day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '06 Day',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Basic7day0',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 30),
                  ),
                  child: const Text(
                    '07 Day',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //     destinations: const [
      //       NavigationDestination(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: 'Home',
      //       ),
      //     ],
      //     selectedIndex: currentPageIndex,
      //     onDestinationSelected: (int index) {
      //       setState(() {
      //         currentPageIndex = index;
      //       });
      //     }),
    );
  }
}
