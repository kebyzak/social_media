import 'package:flutter/material.dart';
import 'package:social_media_app/generated/l10n.dart';
import 'package:story_view/story_view.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoryController controller = StoryController();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: StoryView(
          controller: controller,
          storyItems: [
            StoryItem.text(
              title: S.of(context).thisIsNewSocialMedia,
              backgroundColor: Colors.black,
              roundedTop: true,
            ),
            StoryItem.pageImage(
              url:
                  "https://assets-global.website-files.com/600f71dc9761662e27971832/6028ec00daa7296c6e149c0e_Artboard-1-copy-11.png",
              controller: controller,
            ),
            StoryItem.text(
              title: S.of(context).diverseCommunity,
              backgroundColor: Colors.black,
              roundedTop: true,
            ),
            StoryItem.pageImage(
              url:
                  "https://media.istockphoto.com/id/609070448/photo/the-most-successful-ideas-are-formulated-as-a-team.jpg?s=612x612&w=0&k=20&c=Nmu9wA9hkQMbRGT8ca5m13lbgzmk7HHm9lv4zv3bGOM=",
              controller: controller,
            ),
          ],
          progressPosition: ProgressPosition.top,
          repeat: false,
          inline: true,
        ),
      ),
    );
  }
}
