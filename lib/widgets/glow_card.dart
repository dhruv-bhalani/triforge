import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class GlowCard extends StatefulWidget {
  final Widget child;
  final Color? glowColor;
  final double borderRadius;
  final EdgeInsets? padding;

  const GlowCard({
    super.key,
    required this.child,
    this.glowColor,
    this.borderRadius = 20,
    this.padding,
  });

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.glowColor ?? AppTheme.primary;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        padding: widget.padding ?? const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: _isHovered ? AppTheme.bgCard.withOpacity(0.9) : AppTheme.bgCard,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: _isHovered ? color : AppTheme.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? color.withOpacity(0.2) : Colors.black.withOpacity(0.1),
              blurRadius: _isHovered ? 40 : 20,
              spreadRadius: _isHovered ? 2 : 0,
              offset: _isHovered ? const Offset(0, 10) : const Offset(0, 5),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

class GradientButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final List<Color>? colors;
  final bool outlined;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.colors,
    this.outlined = false,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = widget.colors ?? [AppTheme.primary, AppTheme.secondary];
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : (_isHovered ? 1.05 : 1.0),
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              gradient: widget.outlined ? null : LinearGradient(
                colors: _isHovered ? colors.reversed.toList() : colors,
              ),
              border: widget.outlined
                  ? Border.all(color: colors.first, width: 2)
                  : null,
              borderRadius: BorderRadius.circular(30),
              boxShadow: widget.outlined
                  ? []
                  : [
                      BoxShadow(
                        color: colors.first.withOpacity(_isHovered ? 0.5 : 0.3),
                        blurRadius: _isHovered ? 25 : 15,
                        spreadRadius: _isHovered ? 2 : 0,
                      ),
                    ],
            ),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
