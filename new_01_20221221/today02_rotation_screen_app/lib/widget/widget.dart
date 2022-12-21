import 'package:flutter/material.dart';
import 'package:today02_rotation_screen_app/home.dart';

class WidgetDart {
  Widget portraitMode() {
    return Stack(
      children: [
        portraitmodeBody(),
      ],
    );
  }

  Widget landscapemode() {
    return Stack(
      children: [
        // scafo123(),
        landscapemodBody(),
      ],
    );
  }

  Scaffold scafo123() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rotation Screen',
        ),
      ),
      // portraitmodeBody(),
    );
  }

  Scaffold portraitmodeBody() {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Hello',
          ),
          onPressed: () {
            //-
          },
        ),
      ),
    );
  }

  Scaffold landscapemodBody() {
    bool val = true;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                dkj();
              },
              child: const Text(
                'Flutter',
              ),
            ),
            Switch(
              value: home_ori.bol,
              onChanged: ((value) {
                dkj();
                home_ori.bol = value;
              }),
            ),
          ],
        ),
      ),
    );
  }
} //WidgetDart END

class home_ori {
  static Orientation ori = Orientation.landscape;
  static bool bol = true;
}

dkj() {
  if (home_ori.ori == Orientation.landscape) {
    home_ori.ori = Orientation.portrait;
    home_ori.bol = false;
  } else {
    home_ori.ori = Orientation.landscape;
    home_ori.bol = true;
  }
}
