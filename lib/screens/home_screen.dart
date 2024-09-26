import 'package:flutter/material.dart';
import 'package:get_api/services/get_service.dart';

import '../model/get_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommentsModel> commentsModel = [];

  getComments() {
    GetApiService().getCommentsModel().then((value) {
      setState(() {
        commentsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Get Api",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: commentsModel.length,
          itemBuilder: (context, index) {
            final apidata = commentsModel[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Material(
                color: Colors.blue[100],
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    const SizedBox(width: 3,),
                    CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: Text(
                        apidata.id.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width*0.84,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apidata.name.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            apidata.email.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            apidata.body.toString(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
