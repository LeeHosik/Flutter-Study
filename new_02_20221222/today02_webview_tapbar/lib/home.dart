import 'package:flutter/material.dart';
import 'package:today02_webview_tapbar/webView.dart';

// import 'package:today02_webview_tapbar/webView.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<String> siteName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    siteName = ['naver.com', 'daum.net', 'google.com'];
  }

  @override
  void dispose() {
    /// tabbar 할때 이 종료 안해주면 쓰래기 엄청 쌓임
    tabController.dispose(); // <<<<<<<<
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WebView - tabbar',
        ),
        actions: [
          IconButton(
            onPressed: () {
              //-
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          WebView(siteName: siteName[0]),
          WebView(siteName: siteName[1]),
          WebView(siteName: siteName[2]),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.teal,
        height: 70,
        child: TabBar(
          labelColor: Colors.amber,
          indicatorColor: Colors.blue,
          unselectedLabelColor: Colors.amber,
          controller: tabController,
          tabs: [
            Tab(
              icon: Image.asset(
                'images/arrow-up-black.png',
                width: 30,
                height: 30,
              ),
              text: 'naver',
            ),
            Tab(
              icon: Image.asset(
                'images/daum.png',
                width: 30,
                height: 30,
              ),
              text: 'daum',
            ),
            Tab(
              icon: Image.asset(
                'images/google.png',
                width: 30,
                height: 30,
              ),
              text: 'google',
            ),
          ],
        ),
      ),
    );
  }
}
