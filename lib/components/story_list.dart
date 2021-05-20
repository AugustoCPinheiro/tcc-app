import 'package:flutter/widgets.dart';
import 'package:tcc/components/story.dart';

class StoryList extends StatelessWidget {
  final List<dynamic> stories;

  StoryList({this.stories = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Story();
      },
      scrollDirection: Axis.horizontal,
      itemCount: stories.length,
    );
  }
}
