import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/navigation_controller.dart';
import '../../widgets/app_navbar.dart';
import '../../widgets/particle_background.dart';
import '../../widgets/glow_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/app_footer.dart';
import '../../utils/app_theme.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().initAnimations(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppNavBar(),
      body: Stack(
        children: [
          ParticleBackground(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MobileDrawer(),
                  const _HeroSection(),
                  const _StatsSection(),
                  const _ServicesPreviewSection(),
                  const _WhyUsSection(),
                  const _CTASection(),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 1000;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: isDesktop ? 800 : 600),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: isDesktop ? const Alignment(0.8, -0.5) : Alignment.topCenter,
          radius: 1.5,
          colors: [
            AppTheme.secondary.withOpacity(0.12),
            AppTheme.bgDark,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Glow Orbs
          if (isDesktop) ...[
            Positioned(
              top: 100,
              right: 100,
              child: _GlowOrb(color: AppTheme.primary.withOpacity(0.1), size: 500),
            ),
            Positioned(
              bottom: 100,
              left: 50,
              child: _GlowOrb(color: AppTheme.secondary.withOpacity(0.1), size: 400),
            ),
          ],
          
          Center(
            child: Container(
              // maxWidth: 1200,
              padding: EdgeInsets.symmetric(
                horizontal: width > 1200 ? 0 : 24,
                vertical: isDesktop ? 150 : 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Badge
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withOpacity(0.1),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.primary,
                            ),
                          )
                              .animate(onPlay: (c) => c.repeat())
                              .scale(begin: const Offset(1, 1), end: const Offset(1.6, 1.6), duration: 1000.ms)
                              .then()
                              .scale(begin: const Offset(1.6, 1.6), end: const Offset(1, 1)),
                          const SizedBox(width: 12),
                          Text(
                            '🚀  Next-Gen IT Solutions Provider',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: isDesktop ? 16 : 14,
                              color: AppTheme.primary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Main Title
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      'Forge the Future',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orbitron(
                        fontSize: isDesktop ? 80 : 40,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textWhite,
                        height: 1.1,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    delay: const Duration(milliseconds: 300),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppTheme.primary, AppTheme.secondary],
                      ).createShader(bounds),
                      child: Text(
                        'with Technology',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.orbitron(
                          fontSize: isDesktop ? 80 : 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.1,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Subtitle
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    delay: const Duration(milliseconds: 400),
                    child: Container(
                      // maxWidth: 800,
                      child: Text(
                        'We build cutting-edge digital solutions that transform your business\nand drive exponential growth in the digital era.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: isDesktop ? 20 : 16,
                          color: AppTheme.textGrey,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  
                  // CTA Buttons
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    delay: const Duration(milliseconds: 500),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _HeroButton(
                          label: 'Get Started',
                          onPressed: () {
                            context.read<NavigationController>().changePage(3);
                            Navigator.pushNamed(context, AppRoutes.contact);
                          },
                          isPrimary: true,
                        ),
                        _HeroButton(
                          label: 'Our Services',
                          onPressed: () {
                            context.read<NavigationController>().changePage(2);
                            Navigator.pushNamed(context, AppRoutes.services);
                          },
                          isPrimary: false,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 80),
                  
                  // Tech Showcase
                  Consumer<HomeController>(
                    builder: (context, controller, child) {
                      if (!controller.isLoaded) return const SizedBox.shrink();
                      return FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(milliseconds: 600),
                        child: AnimatedBuilder(
                          animation: controller.floatAnimController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, controller.floatAnim.value),
                              child: child,
                            );
                          },
                          child: const _TechShowcase(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
        ),
      ),
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _HeroButton({
    required this.label,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          decoration: BoxDecoration(
            gradient: widget.isPrimary 
                ? const LinearGradient(colors: [AppTheme.primary, AppTheme.secondary])
                : null,
            border: widget.isPrimary ? null : Border.all(color: AppTheme.primary, width: 2),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              if (widget.isPrimary || _isHovered)
                BoxShadow(
                  color: AppTheme.primary.withOpacity(_isHovered ? 0.4 : 0.2),
                  blurRadius: _isHovered ? 25 : 15,
                  spreadRadius: _isHovered ? 2 : 0,
                ),
            ],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _TechShowcase extends StatelessWidget {
  const _TechShowcase();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final techs = ['Flutter', 'React', 'Node.js', 'Python', 'AWS', 'Firebase', 'Next.js', 'PostgreSQL'];
    
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppTheme.bgCard.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.1),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Technologies We Master',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 15,
              color: AppTheme.textGrey,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: techs.map((t) => _TechBadge(t)).toList(),
          ),
        ],
      ),
    );
  }
}

class _TechBadge extends StatefulWidget {
  final String label;
  const _TechBadge(this.label);

  @override
  State<_TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<_TechBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? AppTheme.primary.withOpacity(0.1) : AppTheme.bgCard2,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered ? AppTheme.primary : AppTheme.border,
            width: 1.5,
          ),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            color: _isHovered ? AppTheme.primary : AppTheme.textWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: AppTheme.bgDark,
        border: Border(
          top: BorderSide(color: AppTheme.border),
          bottom: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Center(
        child: Container(
          // maxWidth: 1200,
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: AppConstants.stats.map((stat) {
              return FadeInUp(
                child: Container(
                  width: 240,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppTheme.bgCard,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppTheme.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppTheme.primary, AppTheme.secondary],
                        ).createShader(bounds),
                        child: Text(
                          stat['value']!,
                          style: GoogleFonts.orbitron(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        stat['label']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          color: AppTheme.textGrey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ServicesPreviewSection extends StatelessWidget {
  const _ServicesPreviewSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 1000;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Center(
        child: Container(
          // maxWidth: 1200,
          child: Column(
            children: [
              const SectionTitle(
                label: 'WHAT WE DO',
                title: 'Our Core Services',
                subtitle: 'End-to-end technology solutions crafted for your success',
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: AppConstants.services.asMap().entries.map((entry) {
                      final i = entry.key;
                      final s = entry.value;
                      return SizedBox(
                        width: isDesktop ? (constraints.maxWidth - 48) / 2 : constraints.maxWidth,
                        child: FadeInUp(
                          delay: Duration(milliseconds: i * 100),
                          child: GlowCard(
                            glowColor: i.isEven ? AppTheme.primary : AppTheme.secondary,
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: i.isEven
                                          ? [AppTheme.primary.withOpacity(0.3), AppTheme.primary.withOpacity(0.1)]
                                          : [AppTheme.secondary.withOpacity(0.3), AppTheme.secondary.withOpacity(0.1)],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      s['icon']!,
                                      style: const TextStyle(fontSize: 32),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s['title']!,
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppTheme.textWhite,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        s['desc']!,
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 15,
                                          color: AppTheme.textGrey,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.textGrey.withOpacity(0.5),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 60),
              _HeroButton(
                label: 'View All Services',
                onPressed: () {
                  context.read<NavigationController>().changePage(2);
                  Navigator.pushNamed(context, AppRoutes.services);
                },
                isPrimary: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WhyUsSection extends StatelessWidget {
  const _WhyUsSection();

  final List<Map<String, String>> reasons = const [
    {'icon': '⚡', 'title': 'Fast Delivery', 'desc': 'On-time project delivery with agile methodology'},
    {'icon': '🏆', 'title': 'Quality First', 'desc': 'Premium code quality with thorough testing'},
    {'icon': '🤝', 'title': '24/7 Support', 'desc': 'Round-the-clock support for all our clients'},
    {'icon': '💡', 'title': 'Innovation', 'desc': 'Cutting-edge solutions using latest technologies'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: AppTheme.bgCard2,
      child: Center(
        child: Container(
          // maxWidth: 1200,
          child: Column(
            children: [
              const SectionTitle(
                label: 'WHY TRIFORGE',
                title: 'Why Choose Us?',
                subtitle: 'We combine expertise with innovation to deliver exceptional results',
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - 48) / (constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 2 : 1));
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: reasons.asMap().entries.map((entry) {
                      final i = entry.key;
                      final r = entry.value;
                      return SizedBox(
                        width: itemWidth > 0 ? itemWidth : 280,
                        child: FadeInUp(
                          delay: Duration(milliseconds: i * 100),
                          child: GlowCard(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(r['icon']!, style: const TextStyle(fontSize: 40)),
                                const SizedBox(height: 20),
                                Text(
                                  r['title']!,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textWhite,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  r['desc']!,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 14,
                                    color: AppTheme.textGrey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        // maxWidth: 1200,
        margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: width > 600 ? 60 : 30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppTheme.secondary, AppTheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            FadeInDown(
              child: Text(
                'Ready to Build Something Amazing?',
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: width > 600 ? 36 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInUp(
              child: Text(
                'Let\'s discuss your project and forge your digital future together.\nOur experts are ready to help you scale.',
                textAlign: TextAlign.center,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 40),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: () {
                  context.read<NavigationController>().changePage(3);
                  Navigator.pushNamed(context, AppRoutes.contact);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Contact Us Now',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.arrow_forward_rounded, color: AppTheme.secondary),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
