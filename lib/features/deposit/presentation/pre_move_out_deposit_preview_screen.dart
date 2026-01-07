import 'package:flutter/material.dart';

class PreMoveOutDepositPreviewScreen extends StatelessWidget {
  const PreMoveOutDepositPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Move-Out Deposit Preview'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Pre-Move-Out Deposit Preview', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: pre-move-out_deposit_preview'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
