import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateYourAccountLandlordScreen extends StatefulWidget {
  const CreateYourAccountLandlordScreen({super.key});

  @override
  State<CreateYourAccountLandlordScreen> createState() => _CreateYourAccountLandlordScreenState();
}

class _CreateYourAccountLandlordScreenState extends State<CreateYourAccountLandlordScreen> {
  bool _usePhone = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/welcome-to-tern');
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/onboarding/landlord/property-lease-setup'),
            child: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        title: const Text('Create account'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Headline(theme: theme, colorScheme: colorScheme),
                    const SizedBox(height: 24),
                    _SegmentedControl(
                      usePhone: _usePhone,
                      onChanged: (value) => setState(() => _usePhone = value),
                      colorScheme: colorScheme,
                      theme: theme,
                    ),
                    const SizedBox(height: 24),
                    _InputField(usePhone: _usePhone, theme: theme, colorScheme: colorScheme),
                    const SizedBox(height: 32),
                    _SendButton(colorScheme: colorScheme),
                    const SizedBox(height: 16),
                    _TermsText(colorScheme: colorScheme),
                    const SizedBox(height: 12),
                    _Subtitle(colorScheme: colorScheme),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.theme, required this.colorScheme});
  final ThemeData theme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create your landlord account',
          textAlign: TextAlign.center,
          style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w800, color: colorScheme.onSurface),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.shield_moon_outlined, color: colorScheme.primary, size: 22),
            const SizedBox(width: 8),
            SizedBox(
              width: 260,
              child: Text(
                'Securely link your properties to TERN and invite tenants later.',
                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.7)),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SegmentedControl extends StatelessWidget {
  const _SegmentedControl({
    required this.usePhone,
    required this.onChanged,
    required this.colorScheme,
    required this.theme,
  });

  final bool usePhone;
  final ValueChanged<bool> onChanged;
  final ColorScheme colorScheme;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    Widget item({required String label, required bool active, required VoidCallback onTap}) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: active ? theme.cardTheme.color : colorScheme.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              boxShadow: active ? const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))] : null,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: active ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          item(label: 'Phone', active: usePhone, onTap: () => onChanged(true)),
          const SizedBox(width: 6),
          item(label: 'Email', active: !usePhone, onTap: () => onChanged(false)),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({required this.usePhone, required this.theme, required this.colorScheme});
  final bool usePhone;
  final ThemeData theme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final label = usePhone ? 'Phone Number' : 'Email Address';
    final placeholder = usePhone ? '(555) 000-0000' : 'you@example.com';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: colorScheme.onSurface)),
        const SizedBox(height: 8),
        TextField(
          keyboardType: usePhone ? TextInputType.phone : TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: const Color(0xFFF6F5F2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFDCDFE5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.push('/onboarding/landlord/property-lease-setup'),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
        child: const Text('Send code', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF112120))),
      ),
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText({required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      'By continuing you agree to receive verification codes for account security.',
      style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6)),
      textAlign: TextAlign.center,
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      'You can invite tenants after you set up your first property.',
      textAlign: TextAlign.center,
      style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6)),
    );
  }
}
