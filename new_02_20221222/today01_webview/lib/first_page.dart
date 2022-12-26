import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return FirstBody();
  }
}

class FirstBody extends StatefulWidget {
  const FirstBody({super.key});

  @override
  State<FirstBody> createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late TextEditingController inputURLtextFeild;
  late bool isLoading;
  late String siteName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    siteName = 'google.com';
    inputURLtextFeild = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        title: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: inputURLtextFeild,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        hintText: 'input url address',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        siteName = inputURLtextFeild.text.trim();
                        _reloadSite();
                      });
                    },
                    icon: const Icon(Icons.run_circle),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all(
              //             Colors.teal,
              //           ),
              //         ),
              //         onPressed: () {
              //           setState(() {
              //             siteName = 'google.com';
              //           });
              //           _reloadSite();
              //         },
              //         child: const Text(
              //           'google',
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all(
              //             Colors.amber,
              //           ),
              //         ),
              //         onPressed: () {
              //           setState(() {
              //             siteName = 'naver.com';
              //           });
              //           _reloadSite();
              //         },
              //         child: const Text(
              //           'naver',
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all(
              //             Colors.purple,
              //           ),
              //         ),
              //         onPressed: () {
              //           setState(() {
              //             siteName = 'daum.net';
              //           });
              //           _reloadSite();
              //         },
              //         child: const Text(
              //           'daum',
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            // android 는 세팅이 따로 필요함
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                if (controller.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      controller.data!.goBack();
                    },
                    child: const Icon(Icons.arrow_back),
                  );
                }
                return Stack();
              },
            ),
          ),
          // FloatingActionButton(onPressed: () {}),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                if (controller.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.yellow,
                    onPressed: () {
                      controller.data!.reload();
                    },
                    child: const Icon(Icons.refresh),
                  );
                }
                return Stack();
              },
            ),
          ),
          // FloatingActionButton(onPressed: () {})
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                if (controller.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      controller.data!.goForward();
                    },
                    child: const Icon(Icons.arrow_forward),
                  );
                }
                return Stack();
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  } // build Wedget END

  // ---------------- Function ----------------
  // 2022-12-22 Hosik
  _reloadSite() {
    _controller.future.then(
      (value) => value.loadUrl('https://$siteName'),
    );
  }
  // ---------------- Function END ----------------
} // END
