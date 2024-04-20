// import 'package:flutter/material.dart';
// import 'package:yuktidea/util/custom_widget/custom_text.dart';
// import 'package:yuktidea/util/globalscolors.dart';
//
// import '../../../util/constant_method.dart';
//
// Widget timer(VoidCallback onTap, {required Null Function() onTap}) {
//   return FutureBuilder<int>(
//     future: startTimer(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const SizedBox(); // Return an empty widget while waiting for the future
//       } else {
//         return GestureDetector(
//           onTap: onTap,
//           child: snapshot.data == 0
//               ? const CustomText(
//             text: "Resend OTP",
//             weight: FontWeight.w400,
//             color: termColor,
//             size: 18,
//             align: TextAlign.center,
//           )
//               : RichText(
//             text: TextSpan(
//               style: const TextStyle(
//                 fontSize: 12.0,
//                 fontFamily: "Metropolis",
//                 color: Colors.white,
//                 fontWeight: FontWeight.w400,
//               ),
//               children: <TextSpan>[
//                 const TextSpan(
//                   text: 'Resend OTP in ',
//                 ),
//                 TextSpan(
//                   text: '${snapshot.data} seconds',
//                   style: const TextStyle(
//                     color: termColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//     },
//   );
// }
//
//
//
