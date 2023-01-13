import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kakao API',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  } //

  /// Function
  ///

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=알고리즘');
    var response = await http.get(url,
        headers: {"Authorization": "e94c87be9f88de575d8cb4b14287976d"});
    //headers: {"Authorization": "  여기에 본인 인증 키 "}

    print(response.body);
    return "sucex";
  }
} //END
