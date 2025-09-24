// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: (json['id'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      receiverId: (json['receiverId'] as num).toInt(),
      content: json['content'] as String,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      isRead: json['isRead'] as bool,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyToId: json['replyToId'] as String?,
      status: $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sent,
      userId: (json['userId'] as num?)?.toInt(),
      visitorId: json['visitorId'] as String?,
      widgetId: json['widgetId'] as String?,
      senderType: json['senderType'] as String?,
      filePath: json['filePath'] as String?,
      fileName: json['fileName'] as String?,
      fileSize: json['fileSize'] as String?,
      fileType: json['fileType'] as String?,
      fileInfo: json['fileInfo'] == null
          ? null
          : FileInfo.fromJson(json['fileInfo'] as Map<String, dynamic>),
      visitorName: json['visitorName'] as String?,
      visitorEmail: json['visitorEmail'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'isRead': instance.isRead,
      'attachments': instance.attachments,
      'replyToId': instance.replyToId,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'userId': instance.userId,
      'visitorId': instance.visitorId,
      'widgetId': instance.widgetId,
      'senderType': instance.senderType,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'fileType': instance.fileType,
      'fileInfo': instance.fileInfo,
      'visitorName': instance.visitorName,
      'visitorEmail': instance.visitorEmail,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.file: 'file',
  MessageType.audio: 'audio',
  MessageType.video: 'video',
  MessageType.location: 'location',
  MessageType.system: 'system',
  MessageType.error: 'error',
};

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};

MessageAttachment _$MessageAttachmentFromJson(Map<String, dynamic> json) =>
    MessageAttachment(
      id: (json['id'] as num).toInt(),
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      fileType: json['fileType'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$MessageAttachmentToJson(MessageAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
      'fileSize': instance.fileSize,
      'thumbnail': instance.thumbnail,
    };

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
      unreadCount: (json['unreadCount'] as num).toInt(),
      lastActivity: DateTime.parse(json['lastActivity'] as String),
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
      'lastActivity': instance.lastActivity.toIso8601String(),
      'isOnline': instance.isOnline,
    };
