import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:name_checker_app/core/models/comment_model.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';

class CommentsCard extends StatefulWidget {
  final CommentModel comment;
  final int depth;
  final Function(CommentModel) onReply;

  const CommentsCard({
    super.key,
    required this.comment,
    this.depth = 0,
    required this.onReply,
  });

  @override
  State<CommentsCard> createState() => _CommentsCardState();
}

class _CommentsCardState extends State<CommentsCard> {
  bool _isRepliesVisible = true;

  @override
  Widget build(BuildContext context) {
    // final cardWidth = MediaQuery.of(context).size.width;
    final maxIndent = kIsWeb ? 50.0 : 30.0;

    return Padding(
      padding: EdgeInsets.only(left: widget.depth * maxIndent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: AppPallete.googleBgColor,
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.only(
                left: kIsWeb ? 16.0 : 8.0,
                right: kIsWeb ? 16.0 : 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.comment.author,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: kIsWeb ? 18 : 16),
                      ),
                      SizedBox(width: 10),
                      if (widget.comment.replies.isNotEmpty)
                        IconButton(
                          icon: Icon(
                            _isRepliesVisible
                                ? Icons.expand_less
                                : Icons.expand_more,
                            size: kIsWeb ? 20 : 18,
                          ),
                          onPressed: () {
                            setState(() {
                              _isRepliesVisible = !_isRepliesVisible;
                            });
                          },
                          tooltip: _isRepliesVisible
                              ? "Hide replies"
                              : "Show replies",
                        ),
                    ],
                  ),

                  SizedBox(height: 4),
                  Text(widget.comment.content,
                      style: TextStyle(fontSize: kIsWeb ? 16 : 14)),
                  // SizedBox(height: 4),
                  TextButton(
                    onPressed: () => _showReplyDialog(context, widget.comment),
                    child: Text("Reply"),
                  ),
                ],
              ),
            ),
          ),
          // Recursively and conditionally render replies
          if (_isRepliesVisible && widget.comment.replies.isNotEmpty)
            Column(
              children: widget.comment.replies
                  .map((reply) => CommentsCard(
                        comment: reply,
                        depth: widget.depth + 1,
                        onReply: widget.onReply,
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  void _showReplyDialog(BuildContext context, CommentModel parent) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Reply to ${parent.author}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Your reply")),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final reply = CommentModel(
                  id: DateTime.now().toString(),
                  content: controller.text,
                  author: "You",
                  parentId: parent.id,
                );
                widget.onReply(reply);
                Navigator.pop(context);
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
