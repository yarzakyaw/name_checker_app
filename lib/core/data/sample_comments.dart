import 'package:name_checker_app/core/models/comment_model.dart';

List<CommentModel> initialComments = [
  CommentModel(
    id: "1",
    content: "This is a top-level comment!",
    author: "Alice",
    replies: [
      CommentModel(
        id: "2",
        content: "Great point!",
        author: "Bob",
        parentId: "1",
        replies: [
          CommentModel(
            id: "3",
            content: "Thanks!",
            author: "Alice",
            parentId: "2",
          ),
        ],
      ),
    ],
  ),
  CommentModel(
    id: "4",
    content: "Another comment here.",
    author: "Charlie",
  ),
];
