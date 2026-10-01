import 'package:flutter/material.dart';
import 'package:strangestoreweb/app/app_theme.dart';
import 'package:strangestoreweb/core/widgets/scroll_reveal.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;

    // ROOT CONTAINER IS ALWAYS VISIBLE (background color)
    return Container(
      color: Colors.black38,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 24 : 40,
      ),
      child: ScrollReveal(
        delay: const Duration(milliseconds: 200),
        slideOffset: 20, // Subtle lift for the content
        child: Column(
          children: [
            if (isMobile) _FooterMobile() else _FooterDesktop(),
            const SizedBox(height: 60),
            const Divider(color: Colors.white10),
            const SizedBox(height: 32),
            Text(
              '© ${DateTime.now().year} STRANGE STORE. ALL RIGHTS RESERVED.',
              style: const TextStyle(
                color: Colors.white24,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STRANGE STORE',
                style: TextStyle(
                  color: AppTheme.pumpkin,
                  fontFamily: AppTheme.displayFont,
                  fontSize: 24,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Handpicked discoveries for those who seek the extraordinary.',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ],
          ),
        ),
        const Spacer(),
        const _FooterColumn(
          title: 'NAVIGATION',
          links: ['Store', 'About', 'Contact'],
        ),
        const SizedBox(width: 80),
        const _FooterColumn(
          title: 'LEGAL',
          links: ['Privacy', 'Terms', 'Refund'],
        ),
      ],
    );
  }
}

class _FooterMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'STRANGE STORE',
          style: TextStyle(
            color: AppTheme.pumpkin,
            fontFamily: AppTheme.displayFont,
            fontSize: 24,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _FooterColumn(
              title: 'NAVIGATION',
              links: ['Store', 'About', 'Contact'],
            ),
            _FooterColumn(
              title: 'LEGAL',
              links: ['Privacy', 'Terms', 'Refund'],
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _FooterColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                link,
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
