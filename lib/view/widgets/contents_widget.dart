import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContentWidget extends ConsumerWidget {
  final int index;
  final String contentTitle;
  final String contents;
  final VoidCallback deleteContent;
  final VoidCallback moveUp;
  final VoidCallback moveDown;
  const ContentWidget(
      {super.key,
      required this.index,
      required this.contentTitle,
      required this.contents,
      required this.deleteContent,
      required this.moveDown,
      required this.moveUp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    contentTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  onPressed: deleteContent,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Text(
              contents,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: moveUp,
                  label: const Text('Move up'),
                  icon: const Icon(Icons.arrow_upward),
                ),
                ElevatedButton.icon(
                  onPressed: moveDown,
                  label: const Text('Move down'),
                  icon: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
