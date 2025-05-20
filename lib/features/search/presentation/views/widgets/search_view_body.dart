import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_appBar.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SearchViewAppBar(),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomSearchTextField(),
                ),
                SliverToBoxAdapter(
                  child: CategoryButton(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                SliverToBoxAdapter(
                  child: SearchResultListView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                    if (flag) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
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
}
