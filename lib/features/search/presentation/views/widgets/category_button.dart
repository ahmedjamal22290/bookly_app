import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final bool isCategory;
  final void Function(bool) onToggle;
  const CategoryButton({
    super.key,
    required this.isCategory,
    required this.onToggle,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _postionAnim;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    _postionAnim = Tween<Offset>(
            begin: const Offset(-14, 0), end: const Offset(14, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.green).animate(_controller);
    if (widget.isCategory) _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CategoryButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCategory != widget.isCategory) {
      widget.isCategory ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Row(
        children: [
          const Text(
            'Search By Category',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(
            width: 8,
          ),
          AnimatedBuilder(
              animation: _postionAnim,
              builder: (context, _) {
                return GestureDetector(
                  onTap: () {
                    final flag = !widget.isCategory;
                    widget.onToggle(flag);
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Transform.translate(
                      offset: _postionAnim.value,
                      child: const Icon(
                        Icons.circle,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
