import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:today02_rotation_screen_app/widget/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Orientation ori;
  WidgetDart wd = WidgetDart();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ori = Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == home_ori.ori) {
            home_ori.bol = true;

            return wd.portraitMode();
          } else {
            home_ori.bol = false;

            return wd.landscapemode();
          }
        },
      ),
    );
  }

  // ----------------------- Function -----------------------
  // Widget portraitMode() {
  //   return Stack(
  //     children: [
  //       Center(
  //         child: Text('Portrait Mode'),
  //       )
  //     ],
  //   );
  // }

  // Widget landscapemode() {
  //   return Stack(
  //     children: [
  //       Center(
  //         child: Image.asset('images/')
  //       )
  //     ],
  //   );
  // }

  // ----------------------- Function END -----------------------
} // END
