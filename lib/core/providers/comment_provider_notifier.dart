import 'package:flutter/material.dart';
import 'package:name_checker_app/core/data/sample_comments.dart';
import 'package:name_checker_app/core/models/comment_model.dart';

class CommentProviderNotifier with ChangeNotifier {
  List<CommentModel> _comments = initialComments;
  List<CommentModel> get comments => _comments;

  void addReply(String parentId, CommentModel reply) {
    _comments = _updateComments(_comments, parentId, reply);
    notifyListeners();
  }

  void addTopLevelComment(CommentModel comment) {
    _comments = [..._comments, comment];
    notifyListeners();
  }

  List<CommentModel> _updateComments(
      List<CommentModel> comments, String parentId, CommentModel reply) {
    return comments.map((comment) {
      if (comment.id == parentId) {
        return comment.copyWithReply(reply);
      } else if (comment.replies.isNotEmpty) {
        return CommentModel(
          id: comment.id,
          content: comment.content,
          author: comment.author,
          replies: _updateComments(comment.replies, parentId, reply),
          parentId: comment.parentId,
        );
      }
      return comment;
    }).toList();
  }
}
