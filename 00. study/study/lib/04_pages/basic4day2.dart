import 'package:flutter/material.dart';

class Basic4day2_justIncreaseSlideBar extends StatefulWidget {
  const Basic4day2_justIncreaseSlideBar({super.key});

  @override
  State<Basic4day2_justIncreaseSlideBar> createState() => _HomeState();
}

class _HomeState extends State<Basic4day2_justIncreaseSlideBar> {
  late double _currentSliderValue;
  late TextEditingController cm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int defaultNum = 0;
    cm = TextEditingController(text: '$defaultNum');
    _currentSliderValue = 2;
  } //initState END

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '증가만 하는 슬라이드 바 ',
          ),
        ),
        body: Column(
          children: [
            TextField(
              controller: cm,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.blue,
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: Colors.blueAccent,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Container(
                  width: 200,
                  child: Slider(
                    min: 0,
                    max: 230,
                    divisions: 230,
                    value: _currentSliderValue,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                        int slideCm = int.parse(cm.text);
                        slideCm++;
                        cm.text = '$slideCm';
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} //END
