// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../data/models/message_data_model.dart';


// class ChatScreen extends StatefulWidget {
//   final String userId;
//   final String carAgentId;

//   ChatScreen({required this.userId, required this.carAgentId});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _textEditingController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   void _sendMessage() async {
//     String message = _textEditingController.text.trim();
//     _textEditingController.clear();

//     if (message.isNotEmpty) {
//       ChatMessage chatMessage = ChatMessage(
//         senderId: widget.userId,
//         receiverId: widget.carAgentId,
//         message: message,
//         timestamp: DateTime.now(),
//       );

//       try {
//         await _firestore.collection('chats').add(chatMessage.toMap());
//       } catch (e) {
//         print('Error sending message: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Screen'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('chats')
//                   .where('senderId', isEqualTo: widget.userId)
//                   .where('receiverId', isEqualTo: widget.carAgentId)
//                   .orderBy('timestamp', descending: true)
//                   .snapshots(),
//               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 List<ChatMessage> messages = snapshot.data!.docs
//                     .map((DocumentSnapshot document) => ChatMessage.fromMap(document.data()))
//                     .toList();

//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     ChatMessage message = messages[index];
//                     return ListTile(
//                       title: Text(message.message),
//                       subtitle: Text(message.senderId),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Type a message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
