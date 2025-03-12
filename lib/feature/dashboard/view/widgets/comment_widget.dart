import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:name_checker_app/core/models/comment_model.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:name_checker_app/feature/dashboard/view/widgets/comments_card.dart';
import 'package:provider/provider.dart';
import 'package:name_checker_app/core/providers/comment_provider_notifier.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final commentNotifier = Provider.of<CommentProviderNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Comments",
              style: TextStyle(
                fontSize: kIsWeb ? 24 : 20,
                fontWeight: FontWeight.bold,
                color: AppPallete.gradient6,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _addTopLevelComment(context, commentNotifier),
              icon: Icon(Icons.add_comment, size: kIsWeb ? 20 : 18),
              label: Text("Add Comment"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: kIsWeb ? 12 : 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: kIsWeb ? 16 : 8),
        // Comment List
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: commentNotifier.comments.length,
            itemBuilder: (context, index) {
              return CommentsCard(
                comment: commentNotifier.comments[index],
                onReply: (reply) => commentNotifier.addReply(
                    commentNotifier.comments[index].id, reply),
              );
            },
          ),
        ),
      ],
    );
  }

  void _addTopLevelComment(
      BuildContext context, CommentProviderNotifier commentProviderNotifier) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "New Comment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Your comment"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final newComment = CommentModel(
                  id: DateTime.now().toString(),
                  content: controller.text,
                  author: "You",
                );
                commentProviderNotifier.addTopLevelComment(newComment);
                Navigator.pop(context);
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
