import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String eleButtonChild;
  late Color buttonColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eleButtonChild = 'Hello';
    buttonColor = Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cnage button color & text',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _onClickButton(),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(150, 40),
            backgroundColor: buttonColor,
          ),
          child: Text(eleButtonChild),
        ),
      ),
    );
  }

  // ------ Function ------

  _onClickButton() {
    setState(() {
      if (eleButtonChild == 'Hello') {
        eleButtonChild = 'Flutter';
        buttonColor = Colors.amber;
      } else {
        eleButtonChild = 'Hello';
        buttonColor = Colors.blue;
      }
    }); //setStateEND
  } //_onClickButton END

  // ------ Function END ------
}// END
