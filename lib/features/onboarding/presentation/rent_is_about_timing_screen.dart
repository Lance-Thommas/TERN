import 'package:flutter/material.dart';

class RentIsAboutTimingScreen extends StatelessWidget {
  const RentIsAboutTimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent Is About Timing'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Rent Is About Timing', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: rent_is_about_timing'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
