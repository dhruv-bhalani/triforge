import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 1000;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
          ),
          child: Text(
            label,
            style: GoogleFonts.orbitron(
              fontSize: 14,
              color: AppTheme.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.orbitron(
            fontSize: isDesktop ? 48 : 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.textWhite,
            height: 1.2,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Container(
            // maxWidth: 700,
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontSize: isDesktop ? 18 : 15,
                color: AppTheme.textGrey,
                height: 1.6,
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primary, AppTheme.secondary],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
