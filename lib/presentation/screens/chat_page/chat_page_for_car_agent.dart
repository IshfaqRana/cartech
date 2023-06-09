import 'package:cartech/data/models/user_data_model.dart';
import 'package:cartech/utils/app_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../agent_home/agent_home_controller.dart';

class ChatPageForCarAgents extends StatefulWidget {
  final String user_id;
  final int timestamp;
  const ChatPageForCarAgents({
    Key? key,
    required this.user_id,
    required this.timestamp,
  }) : super(key: key);

  // const AvailableSlotsPage({ Key? key }) : super(key: key);
  @override
  _ChatPageForCarAgentsState createState() => _ChatPageForCarAgentsState();
}

class _ChatPageForCarAgentsState extends State<ChatPageForCarAgents> {
  double myTextFieldWidth = 0.75;
  double myTextFieldHeight = 0.15;

  Widget _chatWidget(String messageText, String timeText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), //changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(messageText)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(timeText)],
            ),
          ],
        ),
      ),
    );
  }

  String readTimestamps(int timestamp) {
    DateTime now = DateTime.now();
    var format = DateFormat('HH:mm a');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var time = format.format(date);
    return time;
  }

  String readTimestamp(int timestamp) {
    DateTime now = DateTime.now();
    var format = DateFormat('mm/dd/yyyy');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';
    bool condition1 = (diff.inSeconds > 0 && diff.inMinutes == 0);
    bool condition2 = (diff.inMinutes > 0 && diff.inHours == 0);
    bool condition3 = ((diff.inHours > 0 && diff.inDays == 0));
    if (condition1) {
      time = 'Today';
    } else if (condition2) {
      time = 'Today';
    } else if (condition3) {
      time = 'Today';
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = 'Yesterday';
      } else {
        time = '${diff.inDays} DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} WEEK AGO';
      } else {
        time = '${(diff.inDays / 7).floor()} WEEKS AGO';
      }
    }

    return time;
  }

  AgentHomeController agentHomeController = Get.put(AgentHomeController());

  UserDataModel user = UserDataModel();

  String name = "";

  @override
  void initState() {
    user = agentHomeController.users
        .firstWhere((element) => element.uid == widget.user_id);
    name = user.name ?? "Car Agent";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController chat = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: const Text(
          'Agent Chat',
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.001,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 6), //changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.logo)
                            //NetworkImage(users.image_url),
                            ),
                        title: Text(
                          name,
                          // users.first_name + " " + users.last_name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '___',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35, right: 35, top: 20),
                              child: Text(
                                readTimestamp(widget.timestamp),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                            ),
                            const Text(
                              '___',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("car_agents")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("chats")
                              .doc(widget.user_id)
                              .collection("messages")
                              .snapshots(),
                          builder: (context, snapshot) {
                            return !snapshot.hasData
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.57,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (_, index) {
                                        DocumentSnapshot data =
                                            snapshot.data!.docs[index];

                                        String text = data["text"];
                                        bool flag = false;
                                        if (data['sender_id'] ==
                                            FirebaseAuth
                                                .instance.currentUser!.uid) {
                                          flag = true;
                                        }
                                        //String last_message = data["last_message"];
                                        int timestamp = data["timestamp"];
                                        String readAbleTime =
                                            readTimestamps(timestamp);

                                        return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: flag == true
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      _chatWidget(
                                                          text, readAbleTime),
                                                      const SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  )
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      _chatWidget(
                                                          text, readAbleTime),
                                                      const SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  ));
                                      },
                                    ),
                                  );
                            //       : const Center(
                            //     child: Text(
                            //       "No Chat",
                            //       style: TextStyle(color: Colors.black),
                            //     ),
                            //   ),
                            //   ),
                            // );
                          }),
                      //buttom container for write message in text field
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.075,
              color: Colors.pink[200],
              child: Row(
                children: [
                  myTextFieldWidget(
                      context,
                      'Write your Message',
                      myTextFieldWidth,
                      myTextFieldHeight,
                      false,
                      TextInputType.text,
                      chat),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.01,
            right: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.055,
              child: InkWell(
                onTap: () {
                  DateTime now = DateTime.now();
                  int time = now.millisecondsSinceEpoch;
                  String times = time.toString();
                  FirebaseFirestore.instance
                      .collection("car_agents")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("chats")
                      .doc(widget.user_id)
                      .collection("messages")
                      .doc(times)
                      .set({
                    'id': times,
                    'receiver_id': widget.user_id,
                    'sender_id': FirebaseAuth.instance.currentUser!.uid,
                    'text': chat.text,
                    'timestamp': time
                  });
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(widget.user_id)
                      .collection("chats")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("messages")
                      .doc(times)
                      .set({
                    'id': times,
                    'receiver_id': widget.user_id,
                    'sender_id': FirebaseAuth.instance.currentUser!.uid,
                    'text': chat.text,
                    'timestamp': time
                  });
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(widget.user_id)
                      .collection("chats")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                    'user_id': FirebaseAuth.instance.currentUser!.uid,
                    'last_message': chat.text,
                    'timestamp': time,
                    'sender': "Wagers"
                  });
                  FirebaseFirestore.instance
                      .collection("car_agents")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("chats")
                      .doc(widget.user_id)
                      .set({
                    'user_id': widget.user_id,
                    'last_message': chat.text,
                    'timestamp': time
                  });
                  chat.clear();
                },
                child: Image.asset(
                  'assets/images/tele.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget myTextFieldWidget(
    BuildContext context,
    String myHintText,
    double myTextFieldWidth,
    double myTextFieldHeight,
    bool isPassword,
    TextInputType keyboardType,
    TextEditingController textFieldController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * myTextFieldWidth,
        height: MediaQuery.of(context).size.height * myTextFieldHeight,
        decoration: const ShapeDecoration(
          color: Colors.grey,
          shape: StadiumBorder(),
        ),
        child: TextField(
          controller: textFieldController,
          decoration: InputDecoration(
            labelText: myHintText,
            hintStyle: const TextStyle(color: Colors.black),
            // labelText: 'First Name',
            // labelStyle: TextStyle(color: Colors.black12),
            fillColor: const Color(0xffF7F9F9),
            filled: true,
            // iska effect screen pr tab show hoga jb hum text field ko click nahi karey gy
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            // jb hum text field ko click karey gy tab focusedBorder effect hoga
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
