import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget child;
  const BackgroundGradient({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF152834), Color(0xFF95B0B9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
