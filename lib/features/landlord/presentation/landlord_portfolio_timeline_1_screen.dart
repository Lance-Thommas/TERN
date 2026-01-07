import 'package:flutter/material.dart';

class LandlordPortfolioTimeline1Screen extends StatelessWidget {
  const LandlordPortfolioTimeline1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landlord Portfolio Timeline 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Landlord Portfolio Timeline 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: landlord_portfolio_timeline_1'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
