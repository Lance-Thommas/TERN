import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _bg = Color(0xFFFFFFFF);
const _primary = Color(0xFF1EE6D2);
const _primaryDark = Color(0xFF16B0A1);
const _surface = Color(0xFFF6F5F2);

class PropertyAndLeaseSetupMethodsLandlordScreen extends StatefulWidget {
  const PropertyAndLeaseSetupMethodsLandlordScreen({super.key});

  @override
  State<PropertyAndLeaseSetupMethodsLandlordScreen> createState() => _PropertyAndLeaseSetupMethodsLandlordScreenState();
}

class _PropertyAndLeaseSetupMethodsLandlordScreenState extends State<PropertyAndLeaseSetupMethodsLandlordScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/onboarding/landlord/welcome-side');
            }
          },
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [_primary, Color(0xFF2563EB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'Property & Lease Setup',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('How would you like to add this property?', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              _SetupOption(
                title: 'Add property manually',
                subtitle: 'Enter property and lease details yourself',
                icon: Icons.add_home,
                selected: _selected == 0,
                onTap: () => setState(() => _selected = 0),
                highlight: true,
              ),
              const SizedBox(height: 8),
              _SetupOption(
                title: 'Accept tenant-initiated lease',
                subtitle: 'Review requests from incoming tenants',
                icon: Icons.move_to_inbox,
                selected: _selected == 1,
                onTap: () => setState(() => _selected = 1),
              ),
              const SizedBox(height: 8),
              _SetupOption(
                title: 'Agent-initiated setup',
                subtitle: 'Approve setup created by your agent',
                icon: Icons.badge,
                selected: _selected == 2,
                onTap: () => setState(() => _selected = 2),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lease Details', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: _primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(18)),
                    child: const Text('Manual Entry', style: TextStyle(color: _primaryDark, fontWeight: FontWeight.w700, fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _LabeledField(
                label: 'Property Address',
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.grey),
                    hintText: 'Search property address...',
                    filled: true,
                    fillColor: _surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDCDFE5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: _primary, width: 1.3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFDCDFE5)),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuB-D_k6yLWAF2vqy3TCEWWsC3wtGGDWsBp5Q44VkyAxUpO9FmBbN8sNiRx5a4oi2cydsbK7CAHDi2uquOmRKVnuqiRoPu03CSfYne18vwe-EHW5eLCC3FHkNvYDfo9Ufv746SMAW7knRDUO13doNLPSzsxcwta3OMCsXqU3CScYYSKrsJ4OQnGCI8fQrsDGWwpQeGKK9YmJTbKdIxMuybL4f4JMk25hbfL8V_bZVcS1T3nRRrgCFBRBMaWtKGl63eGY4gyfuokgga_U'),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(6)),
                    child: const Text('Dubai Marina', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF4B5563))),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    child: _LabeledField(
                      label: 'Lease Start',
                      child: _DateField(),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _LabeledField(
                      label: 'Lease End',
                      child: _DateField(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: _LabeledField(
                      label: 'Monthly Rent',
                      child: _CurrencyField(),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _LabeledField(
                      label: 'Deposit Amount',
                      child: _CurrencyField(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _LabeledField(
                label: 'Notice Period',
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFDCDFE5)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                  initialValue: '90 Days (Standard)',
                  items: const [
                    '90 Days (Standard)',
                    '60 Days',
                    '30 Days',
                    'Custom',
                  ].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                  onChanged: (_) {},
                ),
              ),
              const SizedBox(height: 12),
              const _LabeledField(
                label: 'Renewal / Reclaim Clauses',
                child: _MultiLineField(),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  border: Border.all(color: const Color(0xFFD5E3FF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.info_outline, color: Color(0xFF2563EB)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'These are summary cards. You can edit details before confirmation, but full legal text rewriting is not supported on this screen.',
                        style: TextStyle(fontSize: 12, height: 1.4, color: Color(0xFF0F172A)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ElevatedButton(
            onPressed: () => context.push('/onboarding/property-setup'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 4,
              shadowColor: _primary.withValues(alpha: 0.4),
            ),
            child: const Text('Confirm Lease Details', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class _SetupOption extends StatelessWidget {
  const _SetupOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.highlight = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected || highlight ? _surface : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: selected || highlight ? _primary : const Color(0xFFE5E9E8), width: selected || highlight ? 2 : 1),
          boxShadow: highlight
              ? [BoxShadow(color: _primary.withValues(alpha: 0.15), blurRadius: 12, offset: const Offset(0, 6))]
              : [const BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: selected || highlight ? _primary.withValues(alpha: 0.2) : const Color(0xFFE5E9E8),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: selected || highlight ? _primaryDark : const Color(0xFF6B7280)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF6B7280), height: 1.35)),
                ],
              ),
            ),
            if (selected)
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(color: _primary, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              ),
          ],
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Select date',
        suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
        filled: true,
        fillColor: _surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDCDFE5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primary, width: 1.3),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}

class _CurrencyField extends StatelessWidget {
  const _CurrencyField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '0',
        suffixText: 'AED',
        filled: true,
        fillColor: _surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDCDFE5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primary, width: 1.3),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}

class _MultiLineField extends StatelessWidget {
  const _MultiLineField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'E.g. Landlord requires property for personal use upon expiry...',
        filled: true,
        fillColor: _surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDCDFE5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primary, width: 1.3),
        ),
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}
