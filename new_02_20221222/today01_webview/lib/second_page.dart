import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondBody();
  }
}

class SecondBody extends StatefulWidget {
  const SecondBody({super.key});

  @override
  State<SecondBody> createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
