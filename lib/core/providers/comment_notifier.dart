import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:name_checker_app/core/models/comment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_notifier.g.dart';

@riverpod
class CommentNotifier extends _$CommentNotifier {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CommentModel>> build() async {
    // Fetch only top-level comments (parentId is null)
    final snapshot = await _firestore
        .collection('comments')
        .where('parentId', isNull: true)
        .get();
    return snapshot.docs
        .map((doc) => CommentModel.fromMap(doc.data()))
        .toList();
  }

  // Fetch replies for a specific comment
  Future<List<CommentModel>> fetchReplies(String parentId) async {
    final snapshot = await _firestore
        .collection('comments')
        .doc(parentId)
        .collection('replies')
        .get();
    return snapshot.docs
        .map((doc) => CommentModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> addReply(String parentId, CommentModel reply) async {
    state = const AsyncValue.loading();
    try {
      // Add reply to the subcollection 'replies' of the parent comment
      await _firestore
          .collection('comments')
          .doc(parentId)
          .collection('replies')
          .doc(reply.id)
          .set(reply.toMap());

      // Since replies are fetched separately, we don't need to update the top-level state here
      // But we can refresh the UI if needed by refetching top-level comments
      state = AsyncValue.data(await future);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> addTopLevelComment(CommentModel comment) async {
    state = const AsyncValue.loading();
    try {
      await _firestore
          .collection('comments')
          .doc(comment.id)
          .set(comment.toMap());
      final currentComments = await future;
      state = AsyncValue.data([...currentComments, comment]);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

/* import 'package:flutter/material.dart';
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
 */
