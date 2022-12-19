import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:horizontal_picker/horizontal_picker.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late TextEditingController name;
  late List img;
  late String _pickerImg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    img = ['pika1.png', 'pika2.png', 'pika3.png'];
    _pickerImg = "pika1.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  label: Text(
                    'Input Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                '실패. 이렇게는 사용할 수 없는거 같음 ',
              ),
              const SizedBox(
                height: 50,
              ),
              HorizontalPicker(
                minValue: 0,
                maxValue: 2,
                divisions: 2,
                //suffix: "",
                showCursor: true,
                backgroundColor: Colors.white,
                activeItemTextColor: Colors.black,
                passiveItemsTextColor: Colors.black,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    if (value <= 2 || value > 1) {
                      _pickerImg = img[2];
                    } else if (value < 1 || value >= 0) {
                      _pickerImg = img[0];
                    } else if (value >= 1 || value < 2) {
                      _pickerImg[1];
                    }
                  });
                },
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset('images/${_pickerImg}'),
              //Image.asset('images/pika3.png'),
            ],
          ),
        ),
      ),
    );
  }
}
