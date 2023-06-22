import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:serious_dating/screen/chat/ChatScreen.dart';
import 'ChatWidgets.dart';

class AnimatedDialog extends StatefulWidget {
  final double height;
  final double width;

  const AnimatedDialog({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  final firestore = FirebaseFirestore.instance;
  final controller = TextEditingController();
  String search = '';
  bool show = false;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredData = [];

  @override
  Widget build(BuildContext context) {
    if (widget.height != 0) {
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          show = true;
        });
      });
    } else {
      setState(() {
        show = false;
      });
    }

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.width == 0
                ? Colors.redAccent.withOpacity(0)
                : Colors.redAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.width == 0 ? 100 : 0),
              bottomRight: Radius.circular(widget.width == 0 ? 100 : 0),
              bottomLeft: Radius.circular(widget.width == 0 ? 100 : 0),
            ),
          ),
          child: widget.width == 0
              ? null
              : !show
                  ? null
                  : Column(
                      children: [
                        ChatWidgets.searchField(
                          onChange: (a) {
                            setState(() {
                              search = a;
                              filteredData = [];
                              if (search.isNotEmpty) {
                                firestore
                                    .collection("users")
                                    .get()
                                    .then((snapshot) {
                                  filteredData = snapshot.docs
                                      .where(
                                        (element) =>
                                            element['email']
                                                .toString()
                                                .contains(search) ||
                                            element['first_name']
                                                .toString()
                                                .contains(search),
                                      )
                                      .toList();
                                });
                              }
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ListView.builder(
                              itemCount: filteredData.length,
                              itemBuilder: (context, i) {
                                return ChatWidgets.card(
                                  title: filteredData[i]['first_name'],
                                  time: "",
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ChatScreen(
                                            name: filteredData[i]["first_name"],
                                            id: filteredData[i].id.toString(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ],
    );
  }
}
