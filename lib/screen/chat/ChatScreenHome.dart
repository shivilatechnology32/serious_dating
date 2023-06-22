

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serious_dating/screen/chat/ChatScreen.dart';

import '../../utils/styles.dart';
import 'ChatWidgets.dart';
import 'Functions.dart';

class ChatScreenHome extends StatefulWidget {
  static String routeName = "chatScreenHome" ;
  const ChatScreenHome({Key? key}) : super(key: key);

  @override
  State<ChatScreenHome> createState() => _ChatScreenHomeState();
}

class _ChatScreenHomeState extends State<ChatScreenHome> {
  @override
  void initState() {
    Functions.updateAvailability();
    super.initState();
  }

  final firestore = FirebaseFirestore.instance;
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title:  const Text('Chat Messa'),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    open == true ? open = false : open = true;
                  });
                },
                icon: Icon(
                  open == true ? Icons.close_rounded : Icons.search_rounded,
                  size: 30,
                )),
          )
        ],
      ),
      drawer: ChatWidgets.drawer(context),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: Styles.friendsBox(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20,),
                          child: Text(
                            'All Chats',
                            style: Styles.h1().copyWith(color: Colors.indigo),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                            child: StreamBuilder(
                                stream:
                                firestore.collection('rooms').snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  List data = !snapshot.hasData
                                      ? []
                                      : snapshot.data!.docs
                                      .where((element) => element['users']
                                      .toString()
                                      .contains(FirebaseAuth
                                      .instance.currentUser!.uid))
                                      .toList();
                                  return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, i) {
                                      List users = data[i]['users'];
                                      var friend = users.where((element) =>
                                      element !=
                                          FirebaseAuth
                                              .instance.currentUser!.uid);
                                      var user = friend.isNotEmpty
                                          ? friend.first
                                          : users
                                          .where((element) =>
                                      element ==
                                          FirebaseAuth.instance
                                              .currentUser!.uid)
                                          .first;
                                      return FutureBuilder(
                                          future: firestore
                                              .collection('users')
                                              .doc(user)
                                              .get(),
                                          builder:
                                              (context, AsyncSnapshot snap) {
                                            return !snap.hasData
                                                ? Container()
                                                : ChatWidgets.card(
                                              title: snap.data['first_name'],
                                              subtitle: data[i]
                                              ['last_message'],
                                              time: DateFormat('hh:mm a')
                                                  .format(data[i][
                                              'last_message_time']
                                                  .toDate()),
                                              onTap: () {
                                                Navigator.of(context)
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return ChatScreen(
                                                        id: user,
                                                        name: snap
                                                            .data['first_name'],
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          });
                                    },
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ChatWidgets.searchBar(open)
          ],
        ),
      ),
    );
  }
  }

