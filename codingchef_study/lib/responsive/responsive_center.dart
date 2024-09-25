import 'package:flutter/material.dart';

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    required this.maxContentwidth,
    required this.padding,
    required this.child,
  });

  final double maxContentwidth;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: maxContentwidth,
          child: Padding(
            padding: padding,
            child: child,
          )),
    );
  }
}
