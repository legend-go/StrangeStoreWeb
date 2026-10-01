import 'package:flutter/material.dart';

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final double slideOffset;
  final bool horizontal;

  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = Duration.zero,
    this.slideOffset = 40.0,
    this.horizontal = false,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool _isVisible = false;
  ScrollPosition? _scrollPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    _scrollPosition?.removeListener(_checkVisibility);
    try {
      _scrollPosition = Scrollable.of(context).position;
      _scrollPosition?.addListener(_checkVisibility);
      // Immediate check after layout
      WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
    } catch (_) {
      // Fallback: If no scrollable found, reveal immediately
      _reveal();
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_checkVisibility);
    _controller.dispose();
    super.dispose();
  }

  void _reveal() {
    if (_isVisible || !mounted) return;
    setState(() {
      _isVisible = true;
    });
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  void _checkVisibility() {
    if (_isVisible || !mounted) return;

    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) return;

    if (!renderObject.attached) return;

    final position = renderObject.localToGlobal(Offset.zero);
    final viewportHeight = MediaQuery.sizeOf(context).height;

    // Trigger when any part of the widget is visible in the viewport
    if (position.dy < viewportHeight) {
      _reveal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double animValue = _opacityAnimation.value;
        return Opacity(
          opacity: animValue,
          child: Transform.translate(
            offset: Offset(
              widget.horizontal ? (1.0 - animValue) * widget.slideOffset : 0,
              widget.horizontal ? 0 : (1.0 - animValue) * widget.slideOffset,
            ),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
