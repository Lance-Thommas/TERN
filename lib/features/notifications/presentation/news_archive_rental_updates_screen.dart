import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsArchiveRentalUpdatesScreen extends StatelessWidget {
  const NewsArchiveRentalUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('NARU', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('News Archive Rental Updates'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('News Archive Rental Updates', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            SizedBox(height: 12),
            Text('Refer to design: news_archive_rental_updates'),
            SizedBox(height: 12),
            Text('Screen is scrollable, aligned to design structure with mocked data.'),
          ],
        ),
      ),
    );
  }
}
