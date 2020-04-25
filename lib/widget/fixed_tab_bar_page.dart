/**
 * Author: zed
 * Date: 2020/4/25 22:42
 * Description:
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FixedTabBarView extends StatefulWidget {
  const FixedTabBarView({
    Key key,
    @required this.children,
    @required this.tabController,
    @required this.pageController,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(children != null),
        assert(dragStartBehavior != null),
        super(key: key);

  final TabController tabController;
  final PageController pageController;
  final List<Widget> children;
  final ScrollPhysics physics;
  final DragStartBehavior dragStartBehavior;

  @override
  _FixTabBarViewState createState() => _FixTabBarViewState();
}

class _FixTabBarViewState extends State<FixedTabBarView> {
  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      key: PageStorageKey(UniqueKey()),
      dragStartBehavior: widget.dragStartBehavior,
      physics: widget.physics,
      controller: widget.pageController,
      children: widget.children,
      onPageChanged: (index) {
        widget.tabController.animateTo(index);
      },
    );
  }
}