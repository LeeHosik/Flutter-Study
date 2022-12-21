import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:study/07_pages/basic7day3_lampModify.dart';
import 'package:study/07_pages/model/3_lamp_model.dart';

class basic7day3_lampModify_2 extends StatefulWidget {
  const basic7day3_lampModify_2({super.key});

  @override
  State<basic7day3_lampModify_2> createState() =>
      _basic7day3_lampModify_2State();
}

class _basic7day3_lampModify_2State extends State<basic7day3_lampModify_2> {
  late TextEditingController modifyText;
  late bool thislampcontroll;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //modifyText = TextEditingController();
    modifyText = TextEditingController();
    modifyText.text = lamp_model.model_content;
    thislampcontroll = lamp_model.model_lampState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modify Screen',
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: modifyText,
            decoration: const InputDecoration(
              label: Text(
                'change TEXT',
              ),
            ),
          ),
          Switch(
            value: thislampcontroll,
            onChanged: ((value) {
              //--
              setState(() {
                thislampcontroll = value;
              });
            }),
          ),
          ElevatedButton(
            onPressed: () {
              pushFunc();
            },
            child: const Text(
              'OK',
            ),
          ),
        ],
      )),
    );
  }
// ---------------------- Function ----------------------

// 2022-12-20 Hosik

  pushFunc() {
    lamp_model.model_content = modifyText.text.trim();
    lamp_model.model_lampState = thislampcontroll;
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => basic7day3_lampModify(),
      ),
    );
  }

// ---------------------- Function END ----------------------

}// END
