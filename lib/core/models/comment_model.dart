// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CommentModel {
  final String id;
  final String parentId;
  final String content;
  final String author;
  final String timestamp;
  final List<CommentModel>? replies;
  CommentModel({
    required this.id,
    required this.parentId,
    required this.content,
    required this.author,
    required this.timestamp,
    this.replies,
  });

  CommentModel copyWith({
    String? id,
    String? parentId,
    String? content,
    String? author,
    String? timestamp,
    List<CommentModel>? replies,
  }) {
    return CommentModel(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      content: content ?? this.content,
      author: author ?? this.author,
      timestamp: timestamp ?? this.timestamp,
      replies: replies ?? this.replies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parentId': parentId,
      'content': content,
      'author': author,
      'timestamp': timestamp,
      'replies': replies!.map((x) => x.toMap()).toList(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String,
      parentId: map['parentId'] as String,
      content: map['content'] as String,
      author: map['author'] as String,
      timestamp: map['timestamp'] as String,
      replies: map['replies'] != null
          ? List<CommentModel>.from(
              (map['replies'] as List<int>).map<CommentModel?>(
                (x) => CommentModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, parentId: $parentId, content: $content, author: $author, timestamp: $timestamp, replies: $replies)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.parentId == parentId &&
        other.content == content &&
        other.author == author &&
        other.timestamp == timestamp &&
        listEquals(other.replies, replies);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        parentId.hashCode ^
        content.hashCode ^
        author.hashCode ^
        timestamp.hashCode ^
        replies.hashCode;
  }
}

/* class Comment {
  final int id;
  final User user;
  final String content;
  final String timestamp;
  final List<Comment>? replies;
  Comment({
    required this.id,
    required this.user,
    required this.content,
    required this.timestamp,
    this.replies = const [],
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      user: User.fromJson(json['user']),
      content: json['comment'],
      timestamp: json['timestamp'],
      replies:
          (json['replies'] as List?)?.map((e) => Comment.fromJson(e)).toList(),
    );
  }
}

class User {
  final int id;
  final String name;
  final String? profilePic;
  User({required this.id, required this.name, this.profilePic});
} */
