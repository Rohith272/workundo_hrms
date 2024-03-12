import 'package:flutter/material.dart';
import 'package:workundo_hrms/utils/images.dart';
import '../../../../utils/colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? name;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(Images.backgroundImage, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
        ),
        Container(
          child: Text("Sync", style: TextStyle(fontFamily: 'Syncopate',),),
        )
        // Positioned(
        //     child: SizedBox(
        //       child: Container(
        //         margin: const EdgeInsets.fromLTRB(0,2, 0, 0),
        //         decoration: const BoxDecoration(
        //           color: Colors.transparent,
        //           borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
        //         ),
        //         child: SizedBox(
        //           child: Column(
        //             children: [
        //               GestureDetector(
        //                 onTap: () => Get.to(const ServiceRequestScreen(isService: false)),
        //                 child: Container(
        //                   width: MediaQuery.of(context).size.width,
        //                   margin: const EdgeInsets.only(left: 25,right: 25,top: 250),
        //                   decoration: BoxDecoration(
        //                       color: lightGrey8,
        //                       borderRadius: BorderRadius.circular(10)
        //                   ),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Image.asset(Images.installationRquestIcon,width: 70,height: 70,),
        //                       const Text("Request Installation", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
        //                       Container(
        //
        //                         decoration: const BoxDecoration(
        //                             border: Border(
        //                               left: BorderSide(color: darkGrey02),
        //                             )
        //                         ),
        //                         child: Container(
        //                           margin: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
        //                           child: Image.asset(Images.blueArrow, width: 35, height: 35,),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: () => Get.to(const ServiceRequestScreen(isService: true,)),
        //                 child: Container(
        //                   width: MediaQuery.of(context).size.width,
        //                   margin: const EdgeInsets.only(left: 25,right: 25,top: 20),
        //                   decoration: BoxDecoration(
        //                       color: lightGrey8,
        //                       borderRadius: BorderRadius.circular(10)
        //                   ),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Image.asset(Images.serviceRequest,width: 70,height: 70,),
        //                       const Text("Request Service", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
        //                       Container(
        //
        //                         decoration: const BoxDecoration(
        //                             border: Border(
        //                               left: BorderSide(color: darkGrey02),
        //                             )
        //                         ),
        //                         child: Container(
        //                           margin: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
        //                           child: Image.asset(Images.blueArrow, width: 35, height: 35,),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 margin: const EdgeInsets.only(left: 25,right: 25,top: 20),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     GestureDetector(
        //                       onTap: (){
        //                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProductsScreen()));
        //                       },
        //                       child: Container(
        //                         padding: const EdgeInsets.only(top: 10, left: 30,right: 30, bottom: 20),
        //                         decoration: BoxDecoration(
        //                             color: lightblue01,
        //                             borderRadius: BorderRadius.circular(10)
        //                         ),
        //                         child: Column(
        //                           children: [
        //                             Image.asset(Images.myProducts, height: 80, width: 80,),
        //                             const Text("My Products", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,),)
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                     GestureDetector(
        //                       onTap: (){
        //                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const ServiceHistoryScreen()));
        //                       },
        //                       child: Container(
        //                         padding: const EdgeInsets.only(top: 10, left: 20,right: 20, bottom: 20),
        //                         decoration: BoxDecoration(
        //                             color: lightblue01,
        //                             borderRadius: BorderRadius.circular(10)
        //                         ),
        //                         child: Column(
        //                           children: [
        //                             Image.asset(Images.serviceHistory, height: 80, width: 80,),
        //                             const Text("Service History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,),)
        //                           ],
        //                         ),
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     )),
      ],
    );
  }
}