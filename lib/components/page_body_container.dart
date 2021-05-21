import 'package:flutter/widgets.dart';

class PageBodyContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  PageBodyContainer({this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover)),
      child: this.child,
      padding: this.padding,
    );
  }
}
