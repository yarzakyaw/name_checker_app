import 'dart:convert';

import 'package:flutter/foundation.dart';

class CommentModel {
  final String id;
  final String content;
  final String author;
  final List<CommentModel> replies;
  final String? parentId;
  CommentModel({
    required this.id,
    required this.content,
    required this.author,
    this.replies = const [],
    this.parentId,
  });

  CommentModel copyWithReply(CommentModel reply) {
    return CommentModel(
      id: id,
      content: content,
      author: author,
      replies: [...replies, reply],
      parentId: parentId,
    );
  }

  CommentModel copyWith({
    String? id,
    String? content,
    String? author,
    List<CommentModel>? replies,
    String? parentId,
  }) {
    return CommentModel(
      id: id ?? this.id,
      content: content ?? this.content,
      author: author ?? this.author,
      replies: replies ?? this.replies,
      parentId: parentId ?? this.parentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'author': author,
      'replies': replies.map((x) => x.toMap()).toList(),
      'parentId': parentId,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
      replies: List<CommentModel>.from(
        (map['replies'] ?? []).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      parentId: map['parentId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, content: $content, author: $author, replies: $replies, parentId: $parentId)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.author == author &&
        listEquals(other.replies, replies) &&
        other.parentId == parentId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        author.hashCode ^
        replies.hashCode ^
        parentId.hashCode;
  }
}
