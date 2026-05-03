import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../controllers/contact_controller.dart';
import '../../widgets/app_navbar.dart';
import '../../widgets/glow_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/app_footer.dart';
import '../../utils/app_theme.dart';
import '../../utils/app_constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MobileDrawer(),
            _ContactHero(),
            _ContactInfoCards(),
            _ContactForm(),
            _MapPlaceholder(),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class _ContactHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 130.h,
        bottom: 40.h,
        left: 24.w,
        right: 24.w,
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.2,
          colors: [
            AppTheme.accent.withOpacity(0.08),
            AppTheme.bgDark,
          ],
        ),
      ),
      child: FadeInDown(
        child: const SectionTitle(
          label: 'CONTACT US',
          title: 'Let\'s Work Together',
          subtitle: 'Have a project in mind? We\'d love to hear from you.',
        ),
      ),
    );
  }
}

class _ContactInfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<ContactController>();
    final cards = [
      {
        'icon': Icons.phone_rounded,
        'label': 'Call Us',
        'value': AppConstants.phone,
        'action': ctrl.callPhone,
        'color': AppTheme.primary,
      },
      {
        'icon': Icons.email_rounded,
        'label': 'Email Us',
        'value': AppConstants.email,
        'action': ctrl.sendEmail,
        'color': AppTheme.secondary,
      },
      {
        'icon': Icons.location_on_rounded,
        'label': 'Location',
        'value': AppConstants.address,
        'action': () {},
        'color': AppTheme.accent,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        children: cards.asMap().entries.map((entry) {
          final i = entry.key;
          final card = entry.value;
          return FadeInUp(
            delay: Duration(milliseconds: i * 120),
            child: Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: GestureDetector(
                onTap: card['action'] as VoidCallback,
                child: GlowCard(
                  glowColor: card['color'] as Color,
                  child: Row(
                    children: [
                      Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              (card['color'] as Color).withOpacity(0.3),
                              (card['color'] as Color).withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          card['icon'] as IconData,
                          color: card['color'] as Color,
                          size: 22.sp,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card['label'] as String,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 12.sp,
                                color: AppTheme.textGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              card['value'] as String,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: card['color'] as Color,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ContactController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: FadeInUp(
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppTheme.border),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withOpacity(0.05),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppTheme.primary, AppTheme.secondary],
                  ).createShader(bounds),
                  child: Text(
                    'Send us a Message',
                    style: GoogleFonts.orbitron(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Fill the form below and we\'ll get back to you within 24 hours',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 13.sp,
                    color: AppTheme.textGrey,
                  ),
                ),
                SizedBox(height: 24.h),
                _FormField(
                  controller: controller.nameController,
                  label: 'Your Name',
                  hint: 'John Doe',
                  icon: Icons.person_outline,
                  validator: (v) => v!.isEmpty ? 'Please enter your name' : null,
                ),
                SizedBox(height: 16.h),
                _FormField(
                  controller: controller.emailController,
                  label: 'Email Address',
                  hint: 'john@example.com',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v!.isEmpty) return 'Please enter your email';
                    if (!v.contains('@')) return 'Please enter valid email';
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _FormField(
                  controller: controller.messageController,
                  label: 'Your Message',
                  hint: 'Tell us about your project...',
                  icon: Icons.message_outlined,
                  maxLines: 4,
                  validator: (v) => v!.isEmpty ? 'Please enter your message' : null,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: controller.isSending ? null : () => controller.submitForm(context),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            gradient: controller.isSent
                                ? const LinearGradient(
                                    colors: [Color(0xFF00C853), Color(0xFF69F0AE)],
                                  )
                                : const LinearGradient(
                                    colors: [AppTheme.primary, AppTheme.secondary],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primary.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: controller.isSending
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    controller.isSent ? '✅ Message Sent!' : 'Send Message →',
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                SizedBox(height: 20.h),
                // WhatsApp Button
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: controller.openWhatsApp,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF25D366).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: const Color(0xFF25D366).withOpacity(0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('💬', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 10.w),
                          Text(
                            'Chat on WhatsApp',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF25D366),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textWhite,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14.sp,
            color: AppTheme.textWhite,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.spaceGrotesk(
              fontSize: 14.sp,
              color: AppTheme.textGrey,
            ),
            prefixIcon: maxLines == 1
                ? Icon(icon, color: AppTheme.textGrey, size: 18.sp)
                : null,
            filled: true,
            fillColor: AppTheme.bgCard2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppTheme.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppTheme.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppTheme.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
        ),
      ],
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: FadeInUp(
        child: Container(
          height: 200.h,
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppTheme.border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('📍', style: TextStyle(fontSize: 40)),
              SizedBox(height: 12.h),
              Text(
                'Triforge Infotech',
                style: GoogleFonts.orbitron(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textWhite,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                AppConstants.address,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 13.sp,
                  color: AppTheme.textGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
