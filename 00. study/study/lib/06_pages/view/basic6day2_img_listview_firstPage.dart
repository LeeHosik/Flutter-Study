import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  late int filsal;
  late TextEditingController anything;
  late List<bool> sakusen;
  late List<String> _lst;

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
    filsal = 0;
    sakusen = [false, false, false, false];
    _lst = ['도주 ', '선행 ', '선입 ', '추입 '];
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
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 19),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('고유기 타입'),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomSlidingSegmentedControl<int>(
                        initialValue: 2,
                        children: {
                          1: Text('가속기'),
                          2: Text('속도기'),
                          3: Text('회복기'),
                        },
                        decoration: BoxDecoration(
                          color: CupertinoColors.lightBackgroundGray,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        thumbDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            ),
                          ],
                        ),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInToLinear,
                        onValueChanged: (v) {
                          print(v);
                          filsal = v;
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '作戦',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Checkbox(
                          value: sakusen[0],
                          onChanged: (value) {
                            setState(() {
                              sakusen[0] = value!;
                            });
                          }),
                      const Text(
                        '逃げ',
                      ),
                      Checkbox(
                          value: sakusen[1],
                          onChanged: (value) {
                            setState(() {
                              sakusen[1] = value!;
                            });
                          }),
                      const Text(
                        '先行',
                      ),
                      Checkbox(
                          value: sakusen[2],
                          onChanged: (value) {
                            setState(() {
                              sakusen[2] = value!;
                            });
                          }),
                      const Text(
                        '差し',
                      ),
                      Checkbox(
                          value: sakusen[3],
                          onChanged: (value) {
                            setState(() {
                              sakusen[3] = value!;
                              print(sakusen);
                            });
                          }),
                      const Text(
                        '追込',
                      ),
                    ],
                  ),
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
      staticMessage.imgPath = Backimg;
      staticMessage.name = anything.text.trim();
      staticMessage.sakusen = sakusen;
      String nige = sakusen[0] == true ? '도주' : '';
      String sunhang = sakusen[1] == true ? '선행' : '';
      String sunip = sakusen[2] == true ? '선입' : '';
      String chuip = sakusen[3] == true ? '추입' : '';
      String lst = "";
      for (int i = 0; i < sakusen.length; i++) {
        if (sakusen[i] == true) {
          lst = lst + _lst[i];
        }
      }

      staticMessage.category = filsal == 1
          ? '가속기'
          : filsal == 2
              ? '속도기'
              : '회복기';

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
              '${anything.text.trim()} 의 고유기는 ${staticMessage.category}이고, '
              '적성 각질은 $lst 입니다 ',
            ),
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
