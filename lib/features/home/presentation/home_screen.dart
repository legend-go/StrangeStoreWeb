import 'package:flutter/material.dart';
import '../../../app/app_theme.dart';
import 'widgets/brand_section.dart';
import 'widgets/featured_product_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.charcoal,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            FeaturedProductSection(),
            BrandSection(),
            HomeFooter(),
          ],
        ),
      ),
    );
  }
}
