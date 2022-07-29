import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget? child;

  const Background({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          child!,
        ],
      ),
    );
  }
}