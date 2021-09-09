import 'package:flutter/widgets.dart';
import 'package:tcc/components/story.dart';

class StoryList extends StatelessWidget {
  final List<dynamic> stories;

  StoryList({this.stories = const []});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Story();
        },
        scrollDirection: Axis.horizontal,
        itemCount: 3,
      ),
      height: 40.0,
    );
  }
}
