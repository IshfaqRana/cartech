import 'package:cartech/data/models/user_data_model.dart';
import 'package:cartech/data/models/vehicle_data_model.dart';
import 'package:cartech/presentation/screens/agent_home/agent_home_controller.dart';
import 'package:cartech/presentation/screens/chat_page/chat_page_for_car_agent.dart';
import 'package:cartech/presentation/screens/user_home/user_home_controller.dart';
import 'package:cartech/utils/app_images.dart';
import 'package:cartech/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChatforCarAgents extends StatelessWidget {
  // String? barberID;
  const AllChatforCarAgents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AgentHomeController agentHomeController = Get.put(AgentHomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: const Text(
          'All Chats',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(
                  "car_agents/${FirebaseAuth.instance.currentUser?.uid ?? "empty"}/chats")
              .orderBy("timestamp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: snapshot.data!.docs.isNotEmpty
                        ? ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (_, index) {
                              DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              // yaha pr hum firebase sey jo data aa raha hai jason ki form mey osey hum apni Comment wali class mey map krwa rahey hain

                              String userID = data["user_id"];

                              String lastMessage = data["last_message"];
                              int timestamp = data["timestamp"];

                              String readAbleTime =
                                  Utils.readTimestamp(timestamp);

                              UserDataModel? userDataModel =
                                  agentHomeController.users.firstWhereOrNull(
                                      (element) => element.uid == userID);
                              Utils.printDebug(userID);
                              for (var element in agentHomeController.users) {
                                Utils.printDebug(element.uid);
                              }
                              Utils.printDebug(agentHomeController.users
                                  .firstWhere(
                                      (element) => element.uid == userID));
                              Utils.printDebug(agentHomeController.users
                                  .firstWhereOrNull(
                                      (element) => element.uid == userID)!
                                  .uid);
                              String name = userDataModel?.name ?? "User";

                              return GestureDetector(
                                child: ListTile(
                                  leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppImages.logo)
                                      //NetworkImage(user.image_url),
                                      ),
                                  title: Text(name),
                                  subtitle: Text(lastMessage),
                                  trailing: Text(readAbleTime),
                                ),
                                onTap: () {
                                  Get.to(
                                    () => ChatPageForCarAgents(
                                      user_id: userID,
                                      timestamp: timestamp,
                                    ),
                                  );
                                },
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const Divider();
                            },
                          )
                        : const Center(
                            child: Text(
                              "No Chat",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                  );
          }),
    );
  }
}
