import 'package:flutter/material.dart';

class OpeningPreview extends StatelessWidget {
  const OpeningPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final isMobile = width < 600;
          final isTablet = width >= 600 && width < 1024;

          // ============================================================
          // MOBILE
          // ============================================================
          if (isMobile) {
            return Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // BACKGROUND
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/opening/background.png',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0, 0.12),
                  ),
                ),

                // ----------------------------------------------------
                // ROADSIDE LAMP
                // BEHIND CART AND SELLER
                // ----------------------------------------------------
                Positioned(
                  right: -width * 0.08,
                  bottom: height * 0.035,
                  height: height * 0.58,
                  child: Image.asset(
                    'assets/images/opening/roadside_lamp_on.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // ----------------------------------------------------
                // CART
                // LARGE MOBILE SIZE
                // ----------------------------------------------------
                Positioned(
                  left: -width * 0.10,
                  bottom: height * 0.035,
                  width: width * 1.18,
                  child: Image.asset(
                    'assets/images/opening/cart.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // ----------------------------------------------------
                // SELLER
                // LARGE AND CLEARLY VISIBLE
                // ----------------------------------------------------
                Positioned(
                  left: width * 0.39,
                  bottom: height * 0.035,
                  width: width * 0.62,
                  child: Image.asset(
                    'assets/images/opening/seller_pose_reading.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          }

          // ============================================================
          // TABLET
          // ============================================================
          if (isTablet) {
            return Stack(
              children: [
                // BACKGROUND
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/opening/background.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),

                // LAMP - BEHIND
                Positioned(
                  right: width * 0.04,
                  bottom: height * 0.06,
                  height: height * 0.62,
                  child: Image.asset(
                    'assets/images/opening/roadside_lamp_on.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // CART
                Positioned(
                  left: width * 0.04,
                  bottom: height * 0.08,
                  width: width * 0.62,
                  child: Image.asset(
                    'assets/images/opening/cart.png',
                    fit: BoxFit.contain,
                  ),
                ),

                // SELLER
                Positioned(
                  left: width * 0.43,
                  bottom: height * 0.08,
                  width: width * 0.36,
                  child: Image.asset(
                    'assets/images/opening/seller_pose_reading.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          }

          // ============================================================
          // DESKTOP
          // KEEP CURRENT APPROVED DESKTOP COMPOSITION
          // ============================================================
          return Stack(
            children: [
              // BACKGROUND
              Positioned.fill(
                child: Image.asset(
                  'assets/images/opening/background.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),

              // LAMP
              Positioned(
                right: width * 0.12,
                bottom: height * 0.08,
                height: height * 0.75,
                child: Image.asset(
                  'assets/images/opening/roadside_lamp_on.png',
                  fit: BoxFit.contain,
                ),
              ),

              // CART
              Positioned(
                left: width * 0.08,
                bottom: height * 0.12,
                width: width * 0.45,
                child: Image.asset(
                  'assets/images/opening/cart.png',
                  fit: BoxFit.contain,
                ),
              ),

              // SELLER
              Positioned(
                left: width * 0.42,
                bottom: height * 0.15,
                width: width * 0.24,
                child: Image.asset(
                  'assets/images/opening/seller_pose_reading.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
