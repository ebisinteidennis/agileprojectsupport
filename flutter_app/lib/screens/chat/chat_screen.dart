import 'package:flutter/material.dart';
import '../../models/message.dart';
import '../../services/message_service.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

class ChatScreen extends StatefulWidget {
  final int userId;
  final String userName;
  final String? userAvatar;

  const ChatScreen({
    super.key,
    required this.userId,
    required this.userName,
    this.userAvatar,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageService _messageService = MessageService();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  List<Message> _messages = [];
  bool _isLoading = true;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMessages() async {
    setState(() => _isLoading = true);
    
    try {
      // ✅ Fixed method call - no parameters required for getMessages()
      final messages = await _messageService.getMessages(widget.userId.toString());
      if (mounted) {
        setState(() {
          _messages = messages;
          _isLoading = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        AppHelpers.showSnackBar(
          context,
          'Failed to load messages',
          type: SnackBarType.error,  // ✅ Fixed to use SnackBarType
        );
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _sendMessage() async {
    final content = _messageController.text.trim();
    if (content.isEmpty || _isSending) return;

    setState(() => _isSending = true);
    _messageController.clear();

    try {
      // ✅ Fixed method call with correct parameters
      final message = await _messageService.sendMessage(
        visitorId: widget.userId.toString(),
        content: content,
        type: MessageType.text,
      );
      
      if (mounted) {
        setState(() {
          _messages.add(message);
          _isSending = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        AppHelpers.showSnackBar(
          context,
          'Failed to send message',
          type: SnackBarType.error,  // ✅ Fixed to use SnackBarType
        );
        setState(() => _isSending = false);
      }
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: AppConstants.animationMedium,
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppConstants.primaryColor.withOpacity(0.1),
              backgroundImage: widget.userAvatar != null
                  ? NetworkImage(widget.userAvatar!)
                  : null,
              child: widget.userAvatar == null
                  ? Icon(
                      Icons.person,
                      color: AppConstants.primaryColor,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: AppConstants.paddingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Online',
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // Implement voice call
            },
          ),
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              // Implement video call
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Show more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(AppConstants.paddingMedium),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          return _buildMessageBubble(message);
                        },
                      ),
          ),
          
          // Message Input
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Attachment Button
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {
                    // Handle file attachment
                  },
                ),
                
                // Message Input Field
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: AppConstants.inputDecoration(
                      'Type a message',
                      hintText: 'Type a message...',
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                
                const SizedBox(width: AppConstants.paddingSmall),
                
                // Send Button
                Container(
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: _isSending
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.send, color: Colors.white),
                    onPressed: _isSending ? null : _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    // ✅ Fixed to use proper message properties
    final isMe = message.senderType == 'agent' || message.senderId == 1; // Agent messages are from "me"
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingSmall),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppConstants.primaryColor.withOpacity(0.1),
              backgroundImage: widget.userAvatar != null
                  ? NetworkImage(widget.userAvatar!)
                  : null,
              child: widget.userAvatar == null
                  ? Icon(
                      Icons.person,
                      color: AppConstants.primaryColor,
                      size: 16,
                    )
                  : null,
            ),
            const SizedBox(width: AppConstants.paddingSmall),
          ],
          
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              decoration: BoxDecoration(
                color: isMe
                    ? AppConstants.primaryColor
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,  // ✅ Fixed property name - use content instead of message
                    style: AppConstants.bodyStyle.copyWith(
                      color: isMe ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingSmall / 2),
                  Text(
                    message.createdAt.timeFormatted,
                    style: AppConstants.captionStyle.copyWith(
                      color: isMe
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          if (isMe) ...[
            const SizedBox(width: AppConstants.paddingSmall),
            Icon(
              message.isRead ? Icons.done_all : Icons.done,
              color: message.isRead ? AppConstants.primaryColor : Colors.grey,
              size: 16,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Text(
            'Start a conversation',
            style: AppConstants.subheadingStyle.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Text(
            'Send your first message to ${widget.userName}',
            style: AppConstants.bodyStyle.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}