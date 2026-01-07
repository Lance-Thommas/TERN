import 'package:flutter/material.dart';

class DepositResolutionLandlordScreen extends StatelessWidget {
  const DepositResolutionLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Resolution Landlord'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Deposit Resolution Landlord', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: deposit_resolution_landlord'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
