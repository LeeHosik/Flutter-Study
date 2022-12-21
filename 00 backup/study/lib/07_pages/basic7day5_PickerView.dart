import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class basic7day5_PickerView extends StatelessWidget {
  const basic7day5_PickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List _imageName;
  late int selectedItem;
  late String png;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = [
      'Daiwa Scarlet',
      'Kitasan Black',
      'Mejiro Ardan',
      'Mayano Top Gun',
      'Yamanin Zephyr',
      'Mihono Bourbon',
      'Mejiro Bright',
    ];

    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PickerView',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 280,
                height: 100,
                child: CupertinoPicker(
                  //backgroundColor: Colors.amberAccent,
                  itemExtent: 30,
                  scrollController:
                      FixedExtentScrollController(initialItem: 40),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                  children: [
                    Text(_imageName[0]),
                    Text(_imageName[1]),
                    Text(_imageName[2]),
                    Text(_imageName[3]),
                    Text(_imageName[4]),
                  ],
                ),
              ),
              Text('Selected : ${_imageName[selectedItem]}'),
              Image.asset(
                'images/${_imageName[selectedItem]}.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
