import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:strangestoreweb/app/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late AnimationController _floatingController;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return Container(
      width: double.infinity,
      color: AppTheme.charcoal,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context, isTablet),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _HeroContent(
            isMobile: false,
            isTablet: isTablet,
            controller: _entranceController,
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildMascot(isTablet ? 450 : 650, 1.2), // delay factor 1.2
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _HeroContent(
          isMobile: true,
          isTablet: false,
          controller: _entranceController,
        ),
        const SizedBox(height: 48),
        _buildMascot(400, 1.4), // longer delay on mobile
      ],
    );
  }

  Widget _buildMascot(double height, double delayFactor) {
    final Animation<double> entranceOpacity = CurvedAnimation(
      parent: _entranceController,
      curve: Interval(0.4 * delayFactor, 0.9, curve: Curves.easeOut),
    );

    final Animation<Offset> entranceSlide =
        Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _entranceController,
            curve: Interval(0.4 * delayFactor, 0.9, curve: Curves.easeOutCubic),
          ),
        );

    return FadeTransition(
      opacity: entranceOpacity,
      child: SlideTransition(
        position: entranceSlide,
        child: AnimatedBuilder(
          animation: _floatingController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                0,
                8 * math.sin(_floatingController.value * 2 * math.pi),
              ),
              child: child,
            );
          },
          child: Container(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/seller1.png',
              height: height,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final AnimationController controller;

  const _HeroContent({
    required this.isMobile,
    required this.isTablet,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        _staggeredFade(
          delayStart: 0.1,
          child: Text(
            'STRANGE STORE',
            style: TextStyle(
              color: AppTheme.pumpkin,
              fontFamily: AppTheme.decorativeFont,
              fontSize: isMobile ? 14 : 16,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 24),
        _staggeredFade(
          delayStart: 0.2,
          child: Text(
            'Enter the Strange Store',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
              fontFamily: AppTheme.displayFont,
              fontSize: isMobile ? 48 : (isTablet ? 72 : 92),
              height: 1.05,
              fontWeight: FontWeight.w400,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 32),
        _staggeredFade(
          delayStart: 0.4,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 650,
            ),
            child: Text(
              'Books, ideas and unusual discoveries for those who seek something beyond the ordinary.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: isMobile ? 18 : 24,
                height: 1.6,
                fontWeight: FontWeight.w300,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 64),
        _staggeredFade(
          delayStart: 0.6,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.pumpkin,
              foregroundColor: AppTheme.charcoal,
              padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 26),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 0,
            ),
            child: const Text(
              'EXPLORE THE STORE',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 2.5,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _staggeredFade({required double delayStart, required Widget child}) {
    final animation = CurvedAnimation(
      parent: controller,
      curve: Interval(delayStart, delayStart + 0.4, curve: Curves.easeOut),
    );

    final slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              delayStart,
              delayStart + 0.4,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(position: slideAnimation, child: child),
    );
  }
}
