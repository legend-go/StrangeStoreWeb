import 'package:flutter/material.dart';
import 'package:strangestoreweb/app/app_theme.dart';
import 'package:strangestoreweb/core/widgets/scroll_reveal.dart';
import 'package:strangestoreweb/features/products/models/product.dart';

class FeaturedProductSection extends StatelessWidget {
  const FeaturedProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    const featuredProduct = Product(
      id: 'featured-1',
      name: 'The Midnight Grimoire',
      description:
          'A collection of forgotten spells and nocturnal observations from the ancient world, curated for the modern seeker.',
      price: 49.99,
      originalPrice: 75.00,
      mainImage: 'assets/images/ebook_placeholder.png',
      type: ProductType.ebook,
      rating: 4.8,
      reviewCount: 124,
    );

    // ROOT CONTAINER IS ALWAYS VISIBLE - ANIMATION IS INSIDE
    return Container(
      width: double.infinity,
      color: AppTheme.charcoal,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 24 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              const ScrollReveal(
                delay: Duration(milliseconds: 200),
                child: Text(
                  'FEATURED DISCOVERY',
                  style: TextStyle(
                    color: AppTheme.pumpkin,
                    fontFamily: AppTheme.decorativeFont,
                    fontSize: 16,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              if (isMobile)
                _buildMobileLayout(context, featuredProduct)
              else
                _buildDesktopLayout(context, featuredProduct, isTablet),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    Product product,
    bool isTablet,
  ) {
    return ScrollReveal(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.02),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ebook Cover
              Expanded(
                flex: 2,
                child: ScrollReveal(
                  delay: const Duration(milliseconds: 400),
                  child: const _ProductCoverPlaceholder(),
                ),
              ),
              // Product Info
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: 40,
                  ),
                  child: ScrollReveal(
                    delay: const Duration(milliseconds: 600),
                    child: _ProductDetails(product: product, isMobile: false),
                  ),
                ),
              ),
              // Mascot - Sitting pose
              Expanded(
                flex: 2,
                child: ScrollReveal(
                  delay: const Duration(milliseconds: 800),
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/seller2.png',
                      height: isTablet ? 300 : 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ScrollReveal(child: _ProductCoverPlaceholder()),
        const SizedBox(height: 32),
        // Mascot in between on mobile
        ScrollReveal(
          delay: const Duration(milliseconds: 300),
          child: Image.asset(
            'assets/images/seller2.png',
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 32),
        ScrollReveal(
          delay: const Duration(milliseconds: 500),
          child: _ProductDetails(product: product, isMobile: true),
        ),
      ],
    );
  }
}

class _ProductCoverPlaceholder extends StatefulWidget {
  const _ProductCoverPlaceholder();

  @override
  State<_ProductCoverPlaceholder> createState() =>
      _ProductCoverPlaceholderState();
}

class _ProductCoverPlaceholderState extends State<_ProductCoverPlaceholder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.97,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        margin: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.2),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book_rounded,
                size: 64,
                color: AppTheme.pumpkin.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 16),
              const Text(
                '[ BOOK COVER ]',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;
  final bool isMobile;
  const _ProductDetails({required this.product, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          product.name,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontFamily: AppTheme.displayFont,
            fontSize: isMobile ? 32 : 42,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          product.description,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            height: 1.7,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            const Icon(Icons.star_rounded, color: AppTheme.pumpkin, size: 20),
            const SizedBox(width: 4),
            const Text(
              '4.8 (124 reviews)',
              style: TextStyle(color: Colors.white38, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(
                color: AppTheme.pumpkin,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (product.hasDiscount) ...[
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  '\$${product.originalPrice}',
                  style: const TextStyle(
                    color: Colors.white24,
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: isMobile ? double.infinity : 280,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white30),
              padding: const EdgeInsets.symmetric(vertical: 22),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'VIEW BOOK DETAILS',
              style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
