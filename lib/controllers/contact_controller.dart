import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isSending = false;
  bool _isSent = false;

  bool get isSending => _isSending;
  bool get isSent => _isSent;

  Future<void> callPhone() async {
    final uri = Uri.parse('tel:+919099181826');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> sendEmail() async {
    final uri = Uri.parse('mailto:triforgeinfotech@gmail.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/919099181826');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> submitForm(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    _isSending = true;
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 2));
    
    _isSending = false;
    _isSent = true;
    notifyListeners();

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('✅ Message Sent! We will get back to you within 24 hours.'),
          backgroundColor: const Color(0xFF00D4FF).withOpacity(0.8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }

    nameController.clear();
    emailController.clear();
    messageController.clear();
    
    await Future.delayed(const Duration(seconds: 3));
    _isSent = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
