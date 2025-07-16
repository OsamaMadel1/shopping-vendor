import 'package:app/translations.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color gradientStart;
  final Color gradientEnd;
  final VoidCallback? onTap;

  const CardWidget({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.gradientStart = const Color(0xFF6E45E2),
    this.gradientEnd = const Color(0xFF88D3CE),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0.95, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientStart, gradientEnd],
              ),
              boxShadow: [
                BoxShadow(
                  color: gradientEnd.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Text(
                  text.i18n,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
