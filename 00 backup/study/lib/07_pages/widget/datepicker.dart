import 'package:flutter/cupertino.dart';
import 'package:study/07_pages/model/datePicker_model.dart';

class CuDatePicker extends StatelessWidget {
  const CuDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      maximumDate: DateTime.now(),
      minimumYear: 2018,
      maximumYear: 2044,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (DateTime value) {
        datePicker_model.year = DateTime.now().year;
        datePicker_model.month = DateTime.now().month;
        datePicker_model.days = DateTime.now().day;
        datePicker_model.hour = DateTime.now().hour;
        datePicker_model.min = DateTime.now().minute;
        datePicker_model.sec = DateTime.now().second;
      },
    );
  }
}
