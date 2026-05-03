import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import '../../widgets/app_navbar.dart';
import '../../widgets/glow_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/app_footer.dart';
import '../../utils/app_theme.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_routes.dart';
import '../../controllers/navigation_controller.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MobileDrawer(),
            _ServicesHero(),
            _AllServices(),
            _ProcessSection(),
            _TechStack(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class _ServicesHero extends StatelessWidget {
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
          center: Alignment.topCenter,
          radius: 1.0,
          colors: [
            AppTheme.secondary.withOpacity(0.1),
            AppTheme.bgDark,
          ],
        ),
      ),
      child: FadeInDown(
        child: const SectionTitle(
          label: 'SERVICES',
          title: 'What We Offer',
          subtitle:
              'Comprehensive IT solutions from concept to deployment and beyond',
        ),
      ),
    );
  }
}

class _AllServices extends StatelessWidget {
  final List<Map<String, dynamic>> detailedServices = [
    {
      'icon': '📱',
      'title': 'Mobile App Development',
      'desc':
          'We craft beautiful, high-performance mobile apps for iOS and Android using Flutter, React Native, and native technologies.',
      'features': ['Flutter & React Native', 'iOS & Android', 'App Store Deployment', 'Push Notifications'],
      'color': AppTheme.primary,
    },
    {
      'icon': '🌐',
      'title': 'Web Development',
      'desc':
          'Modern, responsive websites and web apps built with the latest frameworks ensuring fast load times and great UX.',
      'features': ['React & Next.js', 'Node.js Backend', 'RESTful APIs', 'SEO Optimized'],
      'color': AppTheme.secondary,
    },
    {
      'icon': '🎨',
      'title': 'UI/UX Design',
      'desc':
          'Stunning interfaces designed for maximum engagement. We turn complex flows into delightful user experiences.',
      'features': ['Figma Designs', 'Prototyping', 'User Research', 'Design Systems'],
      'color': AppTheme.accent,
    },
    {
      'icon': '☁️',
      'title': 'Cloud Solutions',
      'desc':
          'Scale your business with robust cloud infrastructure on AWS, GCP, and Azure with managed DevOps pipelines.',
      'features': ['AWS & GCP', 'CI/CD Pipelines', 'Microservices', 'Auto Scaling'],
      'color': AppTheme.primary,
    },
    {
      'icon': '🤖',
      'title': 'AI & ML Solutions',
      'desc':
          'Harness the power of artificial intelligence to automate processes and gain data-driven insights.',
      'features': ['Machine Learning', 'ChatBots', 'Data Analysis', 'Computer Vision'],
      'color': AppTheme.secondary,
    },
    {
      'icon': '🔒',
      'title': 'Cybersecurity',
      'desc':
          'Protect your digital assets with our comprehensive security audits, pentesting, and secure development practices.',
      'features': ['Security Audits', 'Penetration Testing', 'SSL Setup', 'Compliance'],
      'color': AppTheme.accent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        children: detailedServices.asMap().entries.map((entry) {
          final i = entry.key;
          final s = entry.value;
          return FadeInUp(
            delay: Duration(milliseconds: i * 120),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: GlowCard(
                glowColor: s['color'] as Color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 52.w,
                          height: 52.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                (s['color'] as Color).withOpacity(0.3),
                                (s['color'] as Color).withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Center(
                            child: Text(
                              s['icon'] as String,
                              style: TextStyle(fontSize: 24.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Text(
                            s['title'] as String,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      s['desc'] as String,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 13.sp,
                        color: AppTheme.textGrey,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: (s['features'] as List<String>).map((f) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: (s['color'] as Color).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: (s['color'] as Color).withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            '✓  $f',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11.sp,
                              color: s['color'] as Color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ProcessSection extends StatelessWidget {
  final steps = [
    {'step': '01', 'title': 'Discover', 'desc': 'We understand your requirements and goals'},
    {'step': '02', 'title': 'Design', 'desc': 'Creating wireframes and prototypes'},
    {'step': '03', 'title': 'Develop', 'desc': 'Building with best practices and clean code'},
    {'step': '04', 'title': 'Deploy', 'desc': 'Launch and continuous support'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 24.w),
      color: AppTheme.bgCard2,
      child: Column(
        children: [
          FadeInDown(
            child: const SectionTitle(
              label: 'HOW WE WORK',
              title: 'Our Process',
            ),
          ),
          SizedBox(height: 36.h),
          ...steps.asMap().entries.map((entry) {
            final i = entry.key;
            final s = entry.value;
            return FadeInLeft(
              delay: Duration(milliseconds: i * 100),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppTheme.primary, AppTheme.secondary],
                      ).createShader(bounds),
                      child: Text(
                        s['step']!,
                        style: GoogleFonts.orbitron(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s['title']!,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textWhite,
                            ),
                          ),
                          Text(
                            s['desc']!,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 13.sp,
                              color: AppTheme.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TechStack extends StatelessWidget {
  final techs = [
    'Flutter', 'React', 'Next.js', 'Node.js',
    'Python', 'Django', 'Firebase', 'AWS',
    'Docker', 'MongoDB', 'PostgreSQL', 'GraphQL',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 24.w),
      child: Column(
        children: [
          const SectionTitle(label: 'TECH STACK', title: 'Technologies We Use'),
          SizedBox(height: 30.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            alignment: WrapAlignment.center,
            children: techs.asMap().entries.map((entry) {
              final i = entry.key;
              return FadeInUp(
                delay: Duration(milliseconds: i * 60),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppTheme.bgCard,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Text(
                    entry.value,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13.sp,
                      color: AppTheme.textWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 40.h),
          FadeInUp(
            child: GestureDetector(
              onTap: () {
                context.read<NavigationController>().changePage(3);
                Navigator.pushNamed(context, AppRoutes.contact);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primary, AppTheme.secondary],
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Text(
                  'Start Your Project →',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
