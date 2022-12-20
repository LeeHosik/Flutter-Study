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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = [
      'Daiwa Scarlet.png',
      'Kitasan Black.png',
      'Mejiro Ardan.png',
      'Mayano Top Gun.png',
      'Yamanin Zephyr.png',
      'Mihono Bourbon.ng',
      'Mejiro Bright.png',
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
        child: Column(
          children: [
            CupertinoPicker(
                itemExtent: itemExtent,
                onSelectedItemChanged: onSelectedItemChanged,
                children: children)
          ],
        ),
      ),
    );
  }
}
