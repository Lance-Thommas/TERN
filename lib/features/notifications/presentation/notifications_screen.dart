import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/placeholder_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Rental Rule Update',
      designRef: 'rental_update_what_this_means_for_you / rental_update_impact_(landlord)',
      description: 'Show impact of a regulatory change on the lease; calm, dismissible messaging.',
    );
  }
}
