import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/views/screens/Project/project_card.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {


  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset == _scrollController.position.maxScrollExtent){
      // _loadMoreVertical();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              // if(subTopicList.isNotEmpty)
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                reverse: false,
                                padding: const EdgeInsets.only(top: 12.92),
                                shrinkWrap: true,
                                itemCount: 8,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 12.92,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return ProjectCard();
                                },
                              ),
                              // Container(
                              //   height: 60,
                              //   child: isLoading.value ? const CircularProgressIndicator() : Container(),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}