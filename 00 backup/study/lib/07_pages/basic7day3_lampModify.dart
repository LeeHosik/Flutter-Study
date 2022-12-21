import 'package:flutter/material.dart';
import 'package:study/07_pages/basic7day3_lampModify_2.dart';
import 'package:study/07_pages/model/3_lamp_model.dart';

class basic7day3_lampModify extends StatefulWidget {
  const basic7day3_lampModify({super.key});

  @override
  State<basic7day3_lampModify> createState() => _basic7day3_lampModifyState();
}

class _basic7day3_lampModifyState extends State<basic7day3_lampModify> {
  late TextEditingController lamp_content;
  late bool lampState;
  late String lampImg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lamp_content = TextEditingController();
    lamp_content.text = lamp_model.model_content;
    lampState = lamp_model.model_lampState;
    if (lampState) {
      lampImg = 'images/lamp_on.png';
    } else {
      lampImg = 'images/lamp_off.png';
    }
    //lamp_model(model_content: content, model_lampState: lampState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Screen',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => MoveModify(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: lamp_content,
              decoration: const InputDecoration(
                label: Text(
                  'inputn TEXT',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              lampImg,
              width: 270,
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------- Function ----------------------
  // 2022-12-20 Hosik
  MoveModify() {
    lamp_model.model_content = lamp_content.text.trim();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const basic7day3_lampModify_2(),
      ),
    );
  } // MoveModify END
  // ---------------------- Function END ----------------------
}// END
