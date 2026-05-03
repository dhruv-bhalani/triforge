import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/app_theme.dart';
import '../utils/app_constants.dart';
import '../utils/app_routes.dart';
import '../controllers/navigation_controller.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        border: Border(
          top: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Column(
        children: [
          // Logo & Description
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primary, AppTheme.secondary],
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'T',
                    style: GoogleFonts.orbitron(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Triforge Infotech',
                style: GoogleFonts.orbitron(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textWhite,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            AppConstants.tagline,
            textAlign: TextAlign.center,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 13.sp,
              color: AppTheme.textGrey,
            ),
          ),
          SizedBox(height: 24.h),
          // Quick Links
          Wrap(
            spacing: 16.w,
            runSpacing: 8.h,
            alignment: WrapAlignment.center,
            children: [
              _FooterLink(label: 'Home', route: AppRoutes.home, index: 0),
              _FooterLink(label: 'About', route: AppRoutes.about, index: 1),
              _FooterLink(label: 'Services', route: AppRoutes.services, index: 2),
              _FooterLink(label: 'Contact', route: AppRoutes.contact, index: 3),
            ],
          ),
          SizedBox(height: 24.h),
          Divider(color: AppTheme.border),
          SizedBox(height: 16.h),
          Text(
            '© 2024 Triforge Infotech. All rights reserved.',
            textAlign: TextAlign.center,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12.sp,
              color: AppTheme.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String route;
  final int index;

  const _FooterLink({
    required this.label,
    required this.route,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NavigationController>().changePage(index);
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 13.sp,
          color: AppTheme.textGrey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
