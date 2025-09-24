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
  
  // Additional properties for compatibility
  final int? userId;
  final String? visitorId;
  final String? widgetId;
  final String? senderType;
  final String? filePath;
  final String? fileName;
  final String? fileSize;
  final String? fileType;
  final FileInfo? fileInfo;
  final String? visitorName;
  final String? visitorEmail;

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
    // Additional properties
    this.userId,
    this.visitorId,
    this.widgetId,
    this.senderType,
    this.filePath,
    this.fileName,
    this.fileSize,
    this.fileType,
    this.fileInfo,
    this.visitorName,
    this.visitorEmail,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    // Handle both message formats
    return Message(
      id: json['id'] ?? 0,
      senderId: json['senderId'] ?? json['sender_id'] ?? json['user_id'] ?? 0,
      receiverId: json['receiverId'] ?? json['receiver_id'] ?? 0,
      content: json['content'] ?? json['message'] ?? '',
      type: json['type'] is String 
          ? _parseMessageType(json['type']) 
          : MessageType.text,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : (json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now()),
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      isRead: json['isRead'] ?? json['is_read'] ?? false,
      attachments: json['attachments'] != null
          ? (json['attachments'] as List).map((e) => MessageAttachment.fromJson(e)).toList()
          : null,
      replyToId: json['replyToId']?.toString(),
      status: json['status'] != null 
          ? _parseMessageStatus(json['status'])
          : MessageStatus.sent,
      // Additional properties
      userId: json['user_id'],
      visitorId: json['visitor_id']?.toString(),
      widgetId: json['widget_id'],
      senderType: json['sender_type'],
      filePath: json['file_path'],
      fileName: json['file_name'],
      fileSize: json['file_size'],
      fileType: json['file_type'],
      fileInfo: json['file_info'] != null ? FileInfo.fromJson(json['file_info']) : null,
      visitorName: json['visitor_name'],
      visitorEmail: json['visitor_email'],
    );
  }

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  // Helper methods for compatibility
  String get message => content;
  bool get isFromVisitor => senderType == 'visitor';
  bool get isFromAgent => senderType == 'agent';
  bool get hasFile => fileInfo != null || filePath != null;
  String get displayName => visitorName ?? 'Anonymous';

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
    int? userId,
    String? visitorId,
    String? widgetId,
    String? senderType,
    String? filePath,
    String? fileName,
    String? fileSize,
    String? fileType,
    FileInfo? fileInfo,
    String? visitorName,
    String? visitorEmail,
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
      userId: userId ?? this.userId,
      visitorId: visitorId ?? this.visitorId,
      widgetId: widgetId ?? this.widgetId,
      senderType: senderType ?? this.senderType,
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      fileType: fileType ?? this.fileType,
      fileInfo: fileInfo ?? this.fileInfo,
      visitorName: visitorName ?? this.visitorName,
      visitorEmail: visitorEmail ?? this.visitorEmail,
    );
  }

  static MessageType _parseMessageType(String type) {
    switch (type.toLowerCase()) {
      case 'text': return MessageType.text;
      case 'image': return MessageType.image;
      case 'file': return MessageType.file;
      case 'audio': return MessageType.audio;
      case 'video': return MessageType.video;
      case 'location': return MessageType.location;
      case 'system': return MessageType.system;
      default: return MessageType.text;
    }
  }

  static MessageStatus _parseMessageStatus(String status) {
    switch (status.toLowerCase()) {
      case 'sending': return MessageStatus.sending;
      case 'sent': return MessageStatus.sent;
      case 'delivered': return MessageStatus.delivered;
      case 'read': return MessageStatus.read;
      case 'failed': return MessageStatus.failed;
      default: return MessageStatus.sent;
    }
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

// File Info class for compatibility
class FileInfo {
  final String path;
  final String name;
  final String size;
  final String type;
  final String downloadUrl;

  FileInfo({
    required this.path,
    required this.name,
    required this.size,
    required this.type,
    required this.downloadUrl,
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) {
    return FileInfo(
      path: json['path'] ?? '',
      name: json['name'] ?? '',
      size: json['size'] ?? '',
      type: json['type'] ?? '',
      downloadUrl: json['download_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'name': name,
      'size': size,
      'type': type,
      'download_url': downloadUrl,
    };
  }

  bool get isImage => type.startsWith('image/');
  bool get isPdf => type == 'application/pdf';
  bool get isText => type.startsWith('text/');
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
  @JsonValue('error')
  error,
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