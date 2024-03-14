import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workundo_hrms/utils/colors.dart';
import 'package:workundo_hrms/utils/images.dart';
import 'package:workundo_hrms/views/widgets/bottom_bar.dart';
import 'package:workundo_hrms/views/widgets/custom_search_bar.dart';
import 'package:workundo_hrms/views/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? name;
  final TextEditingController searchKeyController = TextEditingController();

  @override
  void initState() {
    // retriveDetails();
    super.initState();
  }
  // retriveDetails() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   name = preferences.getString("name");
  //
  //   setState(() {
  //     return null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 120,
        title: Container(
          height: 120,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(21, 19.5, 21, 22.17),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white, // Set your desired border color here
                      width: 0.16, // Set the width of the border
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "worksync",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syncopate',
                        fontWeight: FontWeight.w700,
                        fontSize: 17
                      ),
                    ),
                    Container(
                      height: 22.38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.39),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.1,
                          ),
                          color: textFieldBlack
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.39),
                              child: Image.asset(Images.profileImage, height: 22.38, width: 22.38,),
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 7.77, right: 7.77),
                            child: Text(
                              "My Profile",
                              style: TextStyle(
                                  fontFamily: 'Clash',
                                  fontSize: 8.21,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.87,
                      padding: EdgeInsets.fromLTRB(7.42, 5.83, 0, 5.83),
                      margin: EdgeInsets.only(top: 13.75),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.67),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.1,
                        ),
                        color: textFieldBlack,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.68,
                            child: CustomSearchField(
                              hintText: "",
                              textEditingController: searchKeyController,
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search_rounded, color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}