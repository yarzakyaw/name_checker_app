import 'dart:convert';

class CommentModel {
  final String id;
  final String content;
  final String author;
  final String? parentId;
  CommentModel({
    required this.id,
    required this.content,
    required this.author,
    this.parentId,
  });

  CommentModel copyWithReply(CommentModel reply) {
    return CommentModel(
      id: id,
      content: content,
      author: author,
      parentId: parentId,
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
      parentId: parentId ?? this.parentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'author': author,
      'parentId': parentId,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
      parentId: map['parentId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, content: $content, author: $author, parentId: $parentId)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.author == author &&
        other.parentId == parentId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ content.hashCode ^ author.hashCode ^ parentId.hashCode;
  }
}
