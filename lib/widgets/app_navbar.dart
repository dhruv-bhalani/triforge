import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/navigation_controller.dart';
import '../utils/app_theme.dart';
import '../utils/app_routes.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 1000;
    final isTablet = width > 600 && width <= 1000;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppTheme.bgDark.withOpacity(0.9),
        border: Border(
          bottom: BorderSide(color: AppTheme.border, width: 1),
        ),
      ),
      child: Center(
        child: Container(
          // maxWidth: 1400,
          padding: EdgeInsets.symmetric(horizontal: width > 1400 ? 0 : 20),
          child: Row(
            children: [
              // Logo
              const _Logo(),
              const Spacer(),
              if (isDesktop) ...[
                _NavItem(label: 'Home', route: AppRoutes.home, index: 0),
                const SizedBox(width: 10),
                _NavItem(label: 'About', route: AppRoutes.about, index: 1),
                const SizedBox(width: 10),
                _NavItem(label: 'Services', route: AppRoutes.services, index: 2),
                const SizedBox(width: 20),
                const _ContactButton(),
              ] else ...[
                Consumer<NavigationController>(
                  builder: (context, navCtrl, child) {
                    return IconButton(
                      onPressed: navCtrl.toggleMenu,
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          navCtrl.isMenuOpen ? Icons.close : Icons.menu,
                          color: AppTheme.textWhite,
                          size: 28,
                          key: ValueKey(navCtrl.isMenuOpen),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, AppTheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'T',
                  style: GoogleFonts.orbitron(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (width > 450) ...[
              const SizedBox(width: 12),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.orbitron(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  children: const [
                    TextSpan(text: 'Triforge', style: TextStyle(color: AppTheme.textWhite)),
                    TextSpan(text: ' Infotech', style: TextStyle(color: AppTheme.primary)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final String route;
  final int index;
  const _NavItem({required this.label, required this.route, required this.index});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navCtrl, child) {
        final isActive = navCtrl.currentIndex == widget.index;
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              navCtrl.changePage(widget.index);
              Navigator.pushNamed(context, widget.route);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 16,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                      color: isActive 
                          ? AppTheme.primary 
                          : (_isHovered ? AppTheme.textWhite : AppTheme.textGrey),
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 2,
                    width: isActive ? 20 : (_isHovered ? 15 : 0),
                    color: AppTheme.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContactButton extends StatefulWidget {
  const _ContactButton();

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          context.read<NavigationController>().changePage(3);
          Navigator.pushNamed(context, AppRoutes.contact);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered 
                  ? [AppTheme.secondary, AppTheme.primary]
                  : [AppTheme.primary, AppTheme.secondary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withOpacity(_isHovered ? 0.5 : 0.3),
                blurRadius: _isHovered ? 20 : 15,
                spreadRadius: _isHovered ? 2 : 0,
              ),
            ],
          ),
          child: Text(
            'Contact Us',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navCtrl, child) {
        return AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            width: double.infinity,
            color: AppTheme.bgCard,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                _MobileNavItem(label: 'Home', route: AppRoutes.home, index: 0),
                _MobileNavItem(label: 'About', route: AppRoutes.about, index: 1),
                _MobileNavItem(label: 'Services', route: AppRoutes.services, index: 2),
                _MobileNavItem(label: 'Contact Us', route: AppRoutes.contact, index: 3),
              ],
            ),
          ),
          crossFadeState: navCtrl.isMenuOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final String route;
  final int index;
  const _MobileNavItem({required this.label, required this.route, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      title: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          color: AppTheme.textWhite,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppTheme.primary, size: 16),
      onTap: () {
        final navCtrl = context.read<NavigationController>();
        navCtrl.changePage(index);
        navCtrl.closeMenu();
        Navigator.pushNamed(context, route);
      },
    );
  }
}
