import 'package:flutter/material.dart';
import 'package:strangestoreweb/app/app_theme.dart';
import 'package:strangestoreweb/core/widgets/scroll_reveal.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;

    // ROOT CONTAINER IS ALWAYS VISIBLE - ANIMATIONS ARE INSIDE
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 40,
      ),
      color: Colors.black12,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const ScrollReveal(
                delay: Duration(milliseconds: 200),
                child: Text(
                  'Strange Store Identity',
                  style: TextStyle(
                    color: AppTheme.pumpkin,
                    fontFamily: AppTheme.decorativeFont,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ScrollReveal(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  '"Not everything worth finding is ordinary."',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontFamily: AppTheme.displayFont,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const ScrollReveal(
                delay: Duration(milliseconds: 600),
                child: Text(
                  'Strange Store is a curated place for books, ideas, and unusual discoveries. We believe in the power of the extraordinary and the beauty of the mysterious. Our collection is handpicked for those who seek something beyond the conventional.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    height: 1.8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
