import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final int id;
  final int senderId;
  final int receiverId;
  final String content;
  final MessageType type;
  final DateTime createdAt;
  final DateTime? readAt;
  final bool isRead;
  final List<MessageAttachment>? attachments;
  final String? replyToId;
  final MessageStatus status;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.type,
    required this.createdAt,
    this.readAt,
    required this.isRead,
    this.attachments,
    this.replyToId,
    this.status = MessageStatus.sent,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  // Copy with method
  Message copyWith({
    int? id,
    int? senderId,
    int? receiverId,
    String? content,
    MessageType? type,
    DateTime? createdAt,
    DateTime? readAt,
    bool? isRead,
    List<MessageAttachment>? attachments,
    String? replyToId,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt ?? this.readAt,
      isRead: isRead ?? this.isRead,
      attachments: attachments ?? this.attachments,
      replyToId: replyToId ?? this.replyToId,
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
class MessageAttachment {
  final int id;
  final String fileName;
  final String filePath;
  final String fileType;
  final int fileSize;
  final String? thumbnail;

  MessageAttachment({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileSize,
    this.thumbnail,
  });

  factory MessageAttachment.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$MessageAttachmentToJson(this);
}

@JsonSerializable()
class Conversation {
  final int id;
  final int userId;
  final String userName;
  final String? userAvatar;
  final Message? lastMessage;
  final int unreadCount;
  final DateTime lastActivity;
  final bool isOnline;

  Conversation({
    required this.id,
    required this.userId,
    required this.userName,
    this.userAvatar,
    this.lastMessage,
    required this.unreadCount,
    required this.lastActivity,
    required this.isOnline,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}

enum MessageType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('file')
  file,
  @JsonValue('audio')
  audio,
  @JsonValue('video')
  video,
  @JsonValue('location')
  location,
  @JsonValue('system')
  system,
}

enum MessageStatus {
  @JsonValue('sending')
  sending,
  @JsonValue('sent')
  sent,
  @JsonValue('delivered')
  delivered,
  @JsonValue('read')
  read,
  @JsonValue('failed')
  failed,
}