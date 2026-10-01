import 'package:flutter/material.dart';
import 'package:strangestoreweb/app/app_theme.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _HomeAppBarState extends State<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: AppBar(
          backgroundColor: AppTheme.charcoal,
          elevation: 0,
          centerTitle: isMobile,
          title: Text(
            'STRANGE STORE',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppTheme.pumpkin,
              fontFamily: AppTheme.displayFont,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: isMobile
              ? [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white70),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white70,
                    ),
                    onPressed: () {},
                  ),
                ]
              : [
                  const _NavButton(label: 'Home', isSelected: true),
                  const _NavButton(label: 'Store'),
                  const _NavButton(label: 'About'),
                  const _NavButton(label: 'Contact'),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white70),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white70,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _NavButton({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            color: isSelected ? AppTheme.pumpkin : Colors.white70,
            fontSize: 13,
            letterSpacing: 1.5,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
