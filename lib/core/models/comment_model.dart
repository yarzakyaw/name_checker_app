import 'dart:convert';

class CommentModel {
  final String id;
  final String content;
  final String author;
  final String timestamp;
  final List<CommentModel>? replies;
  CommentModel({
    required this.id,
    required this.content,
    required this.author,
    required this.timestamp,
    this.replies = const [],
  });

  CommentModel copyWithReply(CommentModel reply) {
    return CommentModel(
      id: id,
      content: content,
      author: author,
      timestamp: timestamp,
      replies: List<CommentModel>.from(replies ?? [])..add(reply),
    );
  }

  CommentModel copyWith({
    String? id,
    String? content,
    String? author,
    String? parentId,
  }) {
    return CommentModel(
      id: id ?? this.id,
      content: content ?? this.content,
      author: author ?? this.author,
      timestamp: DateTime.now().toIso8601String(),
      replies: replies ?? replies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'author': author,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
      timestamp: map['timestamp'] ?? DateTime.now().toIso8601String(),
      replies: (map['replies'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, content: $content, author: $author, timestamp: $timestamp, replies: $replies)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.author == author &&
        other.timestamp == timestamp &&
        other.replies == replies;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        author.hashCode ^
        timestamp.hashCode ^
        replies.hashCode ^
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
