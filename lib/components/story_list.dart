import 'package:flutter/widgets.dart';

class StoryList extends StatelessWidget {
  final List<dynamic> stories;

  StoryList({this.stories = const []});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return stories[index];
        },
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
      ),
      height: 40.0,
    );
  }
}
