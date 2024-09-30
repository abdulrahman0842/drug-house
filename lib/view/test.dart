// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Drug House'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // Handle search
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () {
//               // Navigate to favorites
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           const HeroBanner(), // Custom widget for the hero section
//           const CategoryWidget(), // Custom widget for categories
//           const SizedBox(height: 20),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Text(
//               'Featured Drugs',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: height * 0.3,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 5, // Replace with your featured drugs count
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 200,
//                   width: 400,
//                   color: Colors.green,
//                 );
//               },
//             ),
//           ),

//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             child: Text(
//               'All Drugs',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 10,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.75,
//             ),
//             itemBuilder: (context, index) {
//               return Container(
//                 height: 200,
//                 width: 400,
//                 color: Colors.green,
//               );
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.category), label: 'Categories'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Favorites'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// class CategoryWidget extends StatelessWidget {
//   const CategoryWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Dummy categories data
//     final List<Map<String, String>> categories = [
//       {'icon': 'assets/icons/antibiotic.png', 'label': 'Antibiotics'},
//       {'icon': 'assets/icons/painkiller.png', 'label': 'Painkillers'},
//       {'icon': 'assets/icons/vitamin.png', 'label': 'Vitamins'},
//       {'icon': 'assets/icons/cold.png', 'label': 'Cold & Flu'},
//       {'icon': 'assets/icons/allergy.png', 'label': 'Allergies'},
//     ];

//     return SizedBox(
//       height: 100.0,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6.0,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Image.asset(
//                     'assets/images/logo.png',
//                     height: 50.0,
//                     width: 50.0,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Text(
//                   'anti biotic',
//                   style: const TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class HeroBanner extends StatelessWidget {
//   const HeroBanner({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10.0),
//       height: 200.0,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.0),
//         image: const DecorationImage(
//           image: AssetImage(
//               'assets/images/medi.jpg'), // Replace with your image asset
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: const Stack(
//         children: [
//           Positioned(
//             left: 20,
//             bottom: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Featured Drug',
//                   style: TextStyle(
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Discover the latest treatments',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.white70,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
