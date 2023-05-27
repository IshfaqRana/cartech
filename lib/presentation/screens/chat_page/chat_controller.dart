import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/message_data_model.dart';

// Function to send a message
void sendMessage(Message message) async {
  try {
    await FirebaseFirestore.instance.collection('chats').add({
      'senderId': message.senderId,
      'receiverId': message.receiverId,
      'content': message.content,
      'timestamp': message.timestamp,
    });
    print('Message sent successfully.');
  } catch (e) {
    print('Error sending message: $e');
  }
}

// Function to fetch messages for a conversation
Stream<List<Message>> getChatMessages(String userId, String agentId) {
  try {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('senderId', whereIn: [userId, agentId])
        .where('receiverId', whereIn: [userId, agentId])
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((querySnapshot) {
          List<Message> messages = [];
          for (var doc in querySnapshot.docs) {
            Map<String, dynamic> data = doc.data();
            messages.add(Message(
              senderId: data['senderId'],
              receiverId: data['receiverId'],
              content: data['content'],
              timestamp: data['timestamp'].toDate(),
            ));
          }
          return messages;
        });
  } catch (e) {
    print('Error fetching chat messages: $e');
    return const Stream<List<Message>>.empty();
  }
}
