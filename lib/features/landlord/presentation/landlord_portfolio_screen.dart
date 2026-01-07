import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/placeholder_screen.dart';

class LandlordPortfolioScreen extends StatelessWidget {
  const LandlordPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Landlord Portfolio',
      designRef: 'landlord_portfolio_timeline_1-2',
      description: 'Portfolio continuity overview with unit selection and notifications.',
    );
  }
}
