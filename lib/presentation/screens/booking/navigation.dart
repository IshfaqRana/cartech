import 'package:flutter/material.dart';

import '../../../utils/text_styles.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigation",
          textAlign: TextAlign.center,
          style: AppTextStyles.regBlack12Bold,
        ),
      ),
      body: const Center(
        child: Text(
          "No Navigation Available yet!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
