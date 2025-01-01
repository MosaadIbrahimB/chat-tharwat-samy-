// import 'package:flutter/material.dart';
// import '../constans.dart';
// import '../feature/login/presentation/widget/button_widget.dart';
// import '../feature/login/data/firebase_model.dart';
// import '../feature/login/presentation/widget/text_widget.dart';
// import '../feature/login/presentation/widget/textfild_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class RegisterView extends StatelessWidget {
//   // String? email,passwod;
//   // var auth=FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: KPrimaryColor,
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             Image.asset(
//               'assets/images/scholar.png',
//               height: 100,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextWidget(
//                   title: 'Scholar chat',
//                   fontSize: 30,
//                   fontFamily: 'Pacifico',
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//
//             //login
//             Row(
//               children: [
//                 TextWidget(
//                     title: 'Register',
//                     fontWeight: FontWeight.bold,
//                     fontFamily: '',
//                     color: Colors.white),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             TextFormFieldWidget(hintText: 'Email',onchang: (e){
//               FirbaseModel.email=e;
//             }),
//             const SizedBox(
//               height: 15,
//             ),
//             TextFormFieldWidget(hintText: 'Password', obscureText: true,onchang: (e){
//               FirbaseModel.passwod=e;
//             }),
//             const SizedBox(
//               height: 15,
//             ),
//
//           //  TextFormfieldModel(hinttext: 'Re-Write Password', obscureText: true),
//             const SizedBox(
//               height: 15,
//             ),
//             InkWell(onTap:  ()async {
//              FirbaseModel.creatUser();
//             }    ,
//               child: BtnWidget(
//                 text: 'Register',
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextWidget(
//                     title: 'You have an account',
//                     color: Colors.white,
//                     fontSize: 20),
//                 InkWell(
//                     onTap: () {
//                       Navigator.pushNamedAndRemoveUntil(context, "loginPage", (route) => false,);
//                     },
//                     child: TextWidget(
//                       title: ' Login',
//                       color: Colors.yellow,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
