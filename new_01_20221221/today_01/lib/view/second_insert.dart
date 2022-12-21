import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:today_01/model/musumeList.dart';

class secondInsert extends StatefulWidget {
  const secondInsert({super.key});

  @override
  State<secondInsert> createState() => _secondInsertState();
}

class _secondInsertState extends State<secondInsert> {
  late TextEditingController chrName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chrName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Insert Umamusume',
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Input Charactor Name',
                    ),
                  ),
                  controller: chrName,
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    // top: 80,
                    // left: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 500,
                          height: 500,
                          child: Image.asset(
                            'images/trapcard.jpeg',
                            width: 400,
                            height: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   child:
                  Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        musumeList.umamusume[index].imgPath,
                        width: 300,
                        height: 300,
                      );
                    },
                    itemCount: musumeList.umamusume.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  ),
                  // )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print(chrName.text);
                },
                child: const Text(
                  'Addition',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
