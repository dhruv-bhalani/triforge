import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../widgets/app_navbar.dart';
import '../../widgets/glow_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/app_footer.dart';
import '../../utils/app_theme.dart';
import '../../utils/app_constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MobileDrawer(),
            _AboutHero(),
            _AboutStory(),
            _TeamSection(),
            _ValuesSection(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 130.h,
        bottom: 60.h,
        left: 24.w,
        right: 24.w,
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.2,
          colors: [
            AppTheme.primary.withOpacity(0.1),
            AppTheme.bgDark,
          ],
        ),
      ),
      child: Column(
        children: [
          FadeInDown(
            child: const SectionTitle(
              label: 'ABOUT US',
              title: 'Who We Are',
              subtitle: 'A passionate team of tech innovators building the future',
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
      child: Column(
        children: [
          FadeInLeft(
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primary.withOpacity(0.1),
                    AppTheme.secondary.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.primary, AppTheme.secondary],
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Icon(Icons.info_outline, color: Colors.white),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Our Story',
                        style: GoogleFonts.orbitron(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textWhite,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppConstants.aboutUs,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 14.sp,
                      color: AppTheme.textGrey,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: FadeInLeft(
                  delay: const Duration(milliseconds: 200),
                  child: GlowCard(
                    glowColor: AppTheme.primary,
                    child: Column(
                      children: [
                        Text('🎯', style: TextStyle(fontSize: 28.sp)),
                        SizedBox(height: 8.h),
                        Text(
                          'Our Mission',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textWhite,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'To empower businesses through innovative technology solutions',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 12.sp,
                            color: AppTheme.textGrey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: FadeInRight(
                  delay: const Duration(milliseconds: 200),
                  child: GlowCard(
                    glowColor: AppTheme.secondary,
                    child: Column(
                      children: [
                        Text('👁️', style: TextStyle(fontSize: 28.sp)),
                        SizedBox(height: 8.h),
                        Text(
                          'Our Vision',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textWhite,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'To be the most trusted IT partner for businesses worldwide',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 12.sp,
                            color: AppTheme.textGrey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 24.w),
      color: AppTheme.bgCard2,
      child: Column(
        children: [
          FadeInDown(
            child: const SectionTitle(
              label: 'OUR TEAM',
              title: 'Meet the Experts',
              subtitle: 'Passionate professionals dedicated to your success',
            ),
          ),
          SizedBox(height: 36.h),
          ...AppConstants.team.asMap().entries.map((entry) {
            final i = entry.key;
            final member = entry.value;
            return FadeInUp(
              delay: Duration(milliseconds: i * 150),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: GlowCard(
                  glowColor: i.isEven ? AppTheme.primary : AppTheme.secondary,
                  child: Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: i.isEven
                                ? [AppTheme.primary, AppTheme.secondary]
                                : [AppTheme.secondary, AppTheme.accent],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            member['emoji']!,
                            style: TextStyle(fontSize: 28.sp),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member['name']!,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textWhite,
                            ),
                          ),
                          Text(
                            member['role']!,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 13.sp,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ValuesSection extends StatelessWidget {
  final values = [
    {'icon': '🌟', 'title': 'Excellence', 'desc': 'We strive for excellence in every project'},
    {'icon': '🔄', 'title': 'Agility', 'desc': 'Fast adaptation to changing requirements'},
    {'icon': '🤝', 'title': 'Integrity', 'desc': 'Honest and transparent in all dealings'},
    {'icon': '🚀', 'title': 'Growth', 'desc': 'Continuous learning and improvement'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 24.w),
      child: Column(
        children: [
          FadeInDown(
            child: const SectionTitle(
              label: 'OUR VALUES',
              title: 'What We Stand For',
            ),
          ),
          SizedBox(height: 36.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1.1,
            children: values.asMap().entries.map((entry) {
              final i = entry.key;
              final v = entry.value;
              return FadeInUp(
                delay: Duration(milliseconds: i * 100),
                child: GlowCard(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(v['icon']!, style: TextStyle(fontSize: 30.sp)),
                      SizedBox(height: 8.h),
                      Text(
                        v['title']!,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textWhite,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        v['desc']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11.sp,
                          color: AppTheme.textGrey,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
