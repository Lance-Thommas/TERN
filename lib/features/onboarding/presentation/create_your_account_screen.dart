import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateYourAccountScreen extends StatefulWidget {
  const CreateYourAccountScreen({super.key});

  @override
  State<CreateYourAccountScreen> createState() => _CreateYourAccountScreenState();
}

class _CreateYourAccountScreenState extends State<CreateYourAccountScreen> {
  bool _usePhone = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('CYA', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Create Your Account'),
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
                    const SizedBox(height: 40),
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
          'Create Your Account',
          textAlign: TextAlign.center,
          style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w800, color: colorScheme.onSurface),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.lock_outline, color: colorScheme.primary, size: 22),
            const SizedBox(width: 8),
            SizedBox(
              width: 260,
              child: Text(
                'We use this to link your lease timeline securely.',
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
              boxShadow: active
                  ? const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))]
                  : null,
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          ),
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 16, color: colorScheme.secondary),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                'We never spam. Your privacy is protected.',
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.secondary),
              ),
            ),
          ],
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
    return ElevatedButton.icon(
      onPressed: () => context.push('/onboarding/connect-bank'),
      icon: Icon(Icons.arrow_forward, color: colorScheme.onSecondaryContainer),
      label: const Text('Send Verification Code'),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: const Color(0xFF102220),
        shadowColor: colorScheme.primary.withValues(alpha: 0.25),
        elevation: 6,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText({required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.secondary, height: 1.4);
    return Text.rich(
      TextSpan(
        text: "By continuing, you agree to TERN's ",
        style: style,
        children: [
          TextSpan(text: 'Terms of Service', style: style?.copyWith(decoration: TextDecoration.underline, color: colorScheme.primary)),
          const TextSpan(text: ' and '),
          TextSpan(text: 'Privacy Policy', style: style?.copyWith(decoration: TextDecoration.underline, color: colorScheme.primary)),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
