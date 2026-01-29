import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeveloperNavScreen extends StatelessWidget {
  const DeveloperNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Navigation'),
        centerTitle: true,
        actions: const [Padding(padding: EdgeInsets.only(right: 12), child: Text('DEV', style: TextStyle(fontWeight: FontWeight.w700)))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: _sections.map((section) => _SectionCard(section: section)).toList(),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.section});
  final _NavSection section;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(section.title, style: const TextStyle(fontWeight: FontWeight.w700)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: section.items
                  .map(
                    (item) => FilledButton.tonal(
                      onPressed: () => context.go(item.path),
                      child: Text(item.label, textAlign: TextAlign.center),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavSection {
  const _NavSection(this.title, this.items);
  final String title;
  final List<_NavItem> items;
}

class _NavItem {
  const _NavItem(this.label, this.path);
  final String label;
  final String path;
}

const _sections = [
  _NavSection(
    'Developer',
    [
      _NavItem('Developer Hub', '/dev'),
      _NavItem('Root / Welcome-To-Tern', '/'),
    ],
  ),
  _NavSection(
    'Onboarding – Tenant',
    [
      _NavItem('Welcome', '/welcome'),
      _NavItem('Welcome to TERN', '/welcome-to-tern'),
      _NavItem('Rent is about timing', '/onboarding/rent-timing'),
      _NavItem('TERN protects time', '/onboarding/tern-protects-time'),
      _NavItem('Good care has upside', '/onboarding/good-care'),
      _NavItem('Rental rights introduction', '/onboarding/rental-rights'),
      _NavItem('Create your account (legacy form)', '/onboarding/create-account-screen'),
      _NavItem('Create your account (placeholder)', '/onboarding/create-account'),
      _NavItem('Lease connection', '/onboarding/lease-connection'),
      _NavItem('Connect bank account', '/onboarding/connect-bank'),
      _NavItem('Onboarding learn', '/onboarding/learn'),
    ],
  ),
  _NavSection(
    'Onboarding – Landlord',
    [
      _NavItem('Welcome (landlord side)', '/onboarding/landlord/welcome-side'),
      _NavItem('Rent is about timing (LL)', '/onboarding/landlord/rent-timing'),
      _NavItem('TERN protects continuity (LL)', '/onboarding/landlord/protects-continuity'),
      _NavItem('Create your account (LL)', '/onboarding/create-account-landlord'),
      _NavItem('Property & lease setup (LL)', '/onboarding/property-setup'),
    ],
  ),
  _NavSection(
    'Timeline & Renewal – Tenant',
    [
      _NavItem('Timeline hub', '/app/timeline'),
      _NavItem('Timeline view 1', '/app/timeline/view-1'),
      _NavItem('Timeline view 2', '/app/timeline/view-2'),
      _NavItem('Timeline view 3', '/app/timeline/view-3'),
      _NavItem('Timeline view 4', '/app/timeline/view-4'),
      _NavItem('Timeline view 5', '/app/timeline/view-5'),
      _NavItem('Renewal hub', '/app/timeline/renewal'),
      _NavItem('Renewal options (LL view)', '/app/timeline/renewal/options'),
      _NavItem('Renewal window 1', '/app/timeline/renewal/window-1'),
      _NavItem('Renewal window 2', '/app/timeline/renewal/window-2'),
      _NavItem('Renew now confirmation', '/app/timeline/renewal/confirm'),
      _NavItem('Rental rights intro (alias)', '/onboarding/rental-rights'),
      _NavItem('Rule update notification', '/app/timeline/rule-update'),
    ],
  ),
  _NavSection(
    'Deposit & Settlement',
    [
      _NavItem('Deposit overview (timeline)', '/app/timeline/deposit'),
      _NavItem('Deposit overview (tenant alt)', '/app/timeline/deposit/tenant'),
      _NavItem('Pre-move-out deposit preview', '/app/timeline/deposit/preview'),
      _NavItem('Move-out & deposit settlement', '/app/timeline/deposit/settlement'),
      _NavItem('Pre-move preview (direct)', '/app/deposit/pre-move-preview'),
      _NavItem('Settlement (direct)', '/app/deposit/move-out-settlement'),
      _NavItem('Deposit resolution (landlord)', '/app/deposit/resolution-landlord'),
    ],
  ),
  _NavSection(
    'Adjustments',
    [
      _NavItem('Adjustments hub', '/app/adjustments'),
      _NavItem('Uneven month offer', '/app/adjustments/offer'),
      _NavItem('Uneven month status', '/app/adjustments/uneven-month'),
      _NavItem('Clear exits reduce loss', '/app/landlord/clear-exits'),
    ],
  ),
  _NavSection(
    'Transition – Tenant',
    [
      _NavItem('Transition hub (quick)', '/app/transition/early-exit'),
      _NavItem('Early exit plan step 1', '/app/transition/early-exit/step-1'),
      _NavItem('Early exit plan step 2', '/app/transition/early-exit/step-2'),
      _NavItem('Request flexibility', '/app/transition/request-flexibility'),
      _NavItem('Continuity record', '/app/transition/continuity-record'),
    ],
  ),
  _NavSection(
    'Transition – Landlord',
    [
      _NavItem('Transition & exit hub (LL)', '/app/transition/landlord'),
      _NavItem('Reclaim initiate (LL path)', '/app/transition/reclaim-initiate'),
      _NavItem('Reclaim initiate (LL direct)', '/app/landlord/reclaim/initiate'),
      _NavItem('Lease closure (LL)', '/app/transition/lease-closure'),
    ],
  ),
  _NavSection(
    'Landlord Portfolio',
    [
      _NavItem('Portfolio tab', '/app/landlord/portfolio'),
      _NavItem('Portfolio timeline 2', '/app/landlord/portfolio/timeline-2'),
      _NavItem('Tenancy history (LL)', '/app/landlord/history'),
    ],
  ),
  _NavSection(
    'Notifications',
    [
      _NavItem('Notifications hub', '/app/notifications'),
      _NavItem('Tenant updates archive', '/app/notifications/archive'),
      _NavItem('Rental update (tenant detail)', '/app/notifications/update'),
      _NavItem('Rental update (landlord detail)', '/app/notifications/update-landlord'),
      _NavItem('Landlord transition signal', '/app/notifications/landlord/transition-signal'),
      _NavItem('Landlord rental rule update', '/app/notifications/landlord/rental-rule'),
      _NavItem('Landlord transition notice 1', '/app/notifications/landlord/transition-1'),
      _NavItem('Landlord transition notice 2', '/app/notifications/landlord/transition-2'),
    ],
  ),
  _NavSection(
    'Home & Profile',
    [
      _NavItem('Home shell tab', '/app/home'),
      _NavItem('Profile', '/app/profile'),
      _NavItem('Profile history', '/app/profile/history'),
      _NavItem('Profile notifications', '/app/profile/notifications'),
    ],
  ),
];
