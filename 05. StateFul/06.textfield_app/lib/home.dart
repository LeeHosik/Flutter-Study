import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Text Feild',
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Input Number',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => clickButton(context),
                    child: const Text(
                      'Enter!',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// -------- Function --------

  clickButton(BuildContext context) {
    if (textEditingController.text.trim().isEmpty) {
      errorSnackBar(context);
    } else {
      showSnackBar(context, textEditingController);
    }
  } //chkEmpty END

// Date : 2022-12-14
// Desc : textfield에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '글자를 입력해 주세요',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // END

// Date : 2022-12-14
// Desc : textfield에 입력한 내용을 출력
showSnackBar(context, textEditingController) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '입력한 글자는 ${textEditingController.text} 입니다.',
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
  );

  // -------- Function END --------
} // showSnackBar END
