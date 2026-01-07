import 'package:flutter/material.dart';

class MoveOutAndDepositSettlementScreen extends StatelessWidget {
  const MoveOutAndDepositSettlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Move-Out And Deposit Settlement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Move-Out And Deposit Settlement', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: move-out_and_deposit_settlement'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
