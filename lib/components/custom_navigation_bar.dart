import "package:flutter/material.dart";

// ignore: must_be_immutable
class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({
    super.key,
    required this.index,
    required this.destinations,
    required this.onSelected,
  });

  int index;
  void Function(int value) onSelected;
  final List<Widget> destinations;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      elevation: 0,
      selectedIndex: index,
      onDestinationSelected: onSelected,
      indicatorColor: Colors.redAccent.withAlpha(90),
      destinations: destinations,
    );
  }
}
