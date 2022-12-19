import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:study/06_pages/model/list_view_model.dart';

class basic6day2_img_listview_firstPage extends StatefulWidget {
  const basic6day2_img_listview_firstPage({super.key});

  @override
  State<basic6day2_img_listview_firstPage> createState() =>
      _basic6day2_img_listview_firstPageState();
}

class _basic6day2_img_listview_firstPageState
    extends State<basic6day2_img_listview_firstPage> {
  late String Backimg;
  late TextEditingController anything;
  late bool chkboxbool;

  List<CardItem> imgitems = [
    ImageCarditem(
      image: Image.asset(
        'images/flower_01.png',
      ),
    ),
    ImageCarditem(
      image: Image.asset(
        'images/flower_02.png',
      ),
    ),
    ImageCarditem(
      image: Image.asset(
        'images/flower_03.png',
      ),
    ),
    ImageCarditem(
      image: Image.asset(
        'images/flower_04.png',
      ),
    ),
    ImageCarditem(
      image: Image.asset(
        'images/flower_05.png',
      ),
    ),
    ImageCarditem(
      image: Image.asset(
        'images/flower_06.png',
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anything = TextEditingController();
    Backimg = 'flower_01';
    chkboxbool = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: TextField(
                      controller: anything,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text(
                          'Input Name',
                        ),
                      ),
                    ),
                  ),
                  Checkbox(
                      value: chkboxbool,
                      onChanged: (value) {
                        setState(() {
                          chkboxbool = value!;
                        });
                      }),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    top: 110,
                    left: 18,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/${Backimg}.png'),
                      radius: 180,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: HorizontalCardPager(
                      onPageChanged: (page) {
                        setState(() {
                          changeImg(page);
                        });
                      },
                      onSelectedItem: (page) {
                        setState(() {
                          changeImg(page);
                        });
                      },
                      items: imgitems,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showDialog(context); /////// <<<<<
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                        ),
                        Text(
                          '  ADD',
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(
                  //       context,
                  //       '/basic6day2_TabBar',
                  //     );
                  //     //  Navigator.of(context).pop();
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.red,
                  //   ),
                  //   child: Row(
                  //     children: const [
                  //       Icon(
                  //         Icons.cancel,
                  //       ),
                  //       Text(
                  //         '  Cancle',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// ------------------ Function ------------------
// 이미지 고를때 static name 변경
  changeImg(value) {
    if (value >= 5) {
      Backimg = "flower_06";
    } else if (value < 5 && value >= 4) {
      Backimg = "flower_05";
    } else if (value < 4 && value >= 3) {
      Backimg = "flower_04";
    } else if (value < 3 && value >= 2) {
      Backimg = "flower_03";
    } else if (value < 2 && value >= 1) {
      Backimg = "flower_02";
    } else if (value < 1 && value >= 0) {
      Backimg = "flower_01";
    }

    staticMessage.name = Backimg;
    print(staticMessage.name);
  } // changeImg END

// 에러 스낵바
  _errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Check Name TextField',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  } // errorSnackBar 뚱

// 확인 눌렀을떄 함수들
  _showDialog(BuildContext context) {
    if (anything.text.trim().isEmpty) {
      _errorSnackBar(context);
    } else {
      showDialog(
        context: context,
        //barrierDismissible: false, // user must tap the button!
        barrierDismissible: true, // user must tap the button!
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              anything.text.trim(),
            ),
            content: Text(
              '이 동물은  입니다. '
              '날 수 ',
            ),
            // content: const Text('YOU JUST ACTIVATED MY TRAP CARD'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pushNamed(
                    context, '/basic6day2_img_listview_secondPage'),
                child: const Text(' OK '),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text(' Cancle '),
              ),
            ],
          );
        },
      );
    }
  } // _showDialog END

// ------------------ Function END ------------------

} //  END
