import 'package:flutter/material.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/text_styles.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Booking",
          textAlign: TextAlign.center,
          style: AppTextStyles.regBlack12Bold,
        ),
      ),
      body: const Center(
        child: Text(
          "No Bookings",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
