// import 'package:flutter/material.dart';
// import 'package:resume/container_bottom_sheet.dart';
// import 'package:resume/faculty_list_page.dart';
//
// class CategoryList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xff0DA2A6),
//         appBar: AppBar(
//           leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_forward_ios_sharp,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//           title: Text(
//             "اختر الكلية",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
//           ),
//           elevation: 0,
//           backgroundColor: Color(0xff0DA2A6),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             color: Color(0xffF3F3F3),
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30),
//               topLeft: Radius.circular(30),
//             ),
//           ),
//           child: ListView(
//             children: [
//               Row(
//                 children: [
//                   FlatButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       "رجوع",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Expanded(child: SizedBox()),
//                   Text(
//                     "اختر من القائمة",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xff0DA2A6)),
//                   ),
//                   Expanded(child: SizedBox()),
//                   Expanded(child: SizedBox()),
//                   Expanded(child: SizedBox()),
//                 ],
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'ministries',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "الوزارات",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'خدمات حكومية',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "خدمات حكومية",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'السجل المدني',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "السجل المدني",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'الشهر العقاري',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "الشهر العقاري",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'الجامعات',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "الجامعات",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'الصيدليات',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "الصيدليات",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'الفنادق',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "الفنادق",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'قاعات الأفراح',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "قاعات الأفراح",
//               ),
//               ContainerBottomSheet(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubCategoryList(
//                         category: 'المولات',
//                       ),
//                     ),
//                   );
//                 },
//                 text: "المولات",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
