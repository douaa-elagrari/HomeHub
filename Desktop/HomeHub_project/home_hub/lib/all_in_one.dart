// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'HomeHub',
//       theme: ThemeData(
//         useMaterial3: true,
//         brightness: Brightness.light,
//         fontFamily: 'Inter',
//         colorScheme: const ColorScheme.light(
//           primary: Color(0xFF004E98),
//           secondary: Color(0xFFFF6700),
//           surface: Colors.white,
//           background: Colors.white,
//           onSurface: Colors.black,
//           onBackground: Colors.black,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         cardColor: Colors.white,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// // ------------------ Professional Model ------------------
// class Professional {
//   final String title;
//   final String name;
//   final String price;
//   final String location;
//   final String image;
//   final String category;
//   bool isFavorite;

//   Professional({
//     required this.title,
//     required this.name,
//     required this.price,
//     required this.location,
//     required this.image,
//     required this.category,
//     this.isFavorite = false,
//   });
// }

// // ------------------ Home Screen ------------------
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreen();
// }

// class _HomeScreen extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final List<String> servicesList = [
//     'Architects',
//     'Interior Design',
//     'Cleaning',
//     'Landscaping',
//     'Plumbing',
//   ];

//   final List<String> productsList = [
//     'Decoration',
//     'Furniture',
//     'Paints',
//     'Lighting',
//     'Tiles',
//     'Curtains',
//   ];

//   final TextEditingController _searchController = TextEditingController();

//   final List<Professional> professionals = [
//     Professional(
//       title: 'Architect',
//       name: 'Fatima Fatima',
//       price: '2000.0 DZD',
//       location: 'Mhalma, Sidi Abdallah',
//       image: 'images/architect.png',
//       category: 'Services',
//     ),
//     Professional(
//       title: 'Plumber',
//       name: 'Ali Ben',
//       price: '1500.0 DZD',
//       location: 'Bab Ezzouar, Algiers',
//       image: 'images/plumber.png',
//       category: 'Services',
//     ),
//     Professional(
//       title: 'Interior Designer',
//       name: 'Sara Kamel',
//       price: '3000.0 DZD',
//       location: 'Cheraga, Algiers',
//       image: 'images/design.png',
//       category: 'Services',
//     ),
//     Professional(
//       title: 'Paint',
//       name: 'ColorMax Store',
//       price: '1000.0 DZD',
//       location: 'Hydra, Algiers',
//       image: 'images/paint.png',
//       category: 'Products',
//     ),
//     Professional(
//       title: 'Furniture',
//       name: 'Modern Living',
//       price: '5000.0 DZD',
//       location: 'Ben Aknoun, Algiers',
//       image: 'images/furni.png',
//       category: 'Products',
//     ),
//   ];

//   List<Professional> filteredList = [];
//   String? selectedCategory;
//   String? selectedSubcategory;

//   @override
//   void initState() {
//     super.initState();
//     filteredList = professionals;
//   }

//   void _filterProfessionals(String query) {
//     final results = professionals.where((p) {
//       final title = p.title.toLowerCase();
//       final name = p.name.toLowerCase();
//       final search = query.toLowerCase();
//       return title.contains(search) || name.contains(search);
//     }).toList();

//     setState(() {
//       filteredList = results;
//       selectedCategory = null;
//       selectedSubcategory = null;
//     });
//   }

//   void _filterByCategory(String category) {
//     setState(() {
//       selectedCategory = category;
//       selectedSubcategory = null;
//       filteredList = professionals
//           .where((p) => p.category.toLowerCase() == category.toLowerCase())
//           .toList();
//     });
//   }

//   void _filterBySubcategory(String subcategory) {
//     setState(() {
//       selectedSubcategory = subcategory;
//       filteredList = professionals.where((p) {
//         return p.title.toLowerCase().contains(subcategory.toLowerCase());
//       }).toList();
//     });
//   }

//   void _onNavBarTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   List<Widget> get _pages => [
//         _buildHomeTab(),
//         _buildSearchTab(),
//         _buildLikesTab(),
//         _buildProfileTab(),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: const Color(0xFF004E98),
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onNavBarTap,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Likes'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }

//   // ------------------ Tabs ------------------
//   Widget _buildHomeTab() {
//     List<String> subcategories = [];
//     if (selectedCategory == 'Services') subcategories = servicesList;
//     if (selectedCategory == 'Products') subcategories = productsList;

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Top Container + Search Bar
//           Container(
//             padding: const EdgeInsets.only(top: 30),
//             width: double.infinity,
//             height: 300,
//             decoration: const BoxDecoration(
//               color: Color(0xFF004E98),
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 25,
//                             backgroundColor: Colors.white,
//                             child: Icon(Icons.person, size: 35, color: Colors.grey),
//                           ),
//                           const SizedBox(width: 10),
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Welcome Back',
//                                 style: TextStyle(
//                                   color: Color(0xFFFF6700),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'Username',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const Icon(Icons.notifications_outlined, color: Color(0xFFFF6700), size: 30)
//                     ],
//                   ),
//                   const SizedBox(height: 75),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         )
//                       ],
//                     ),
//                     child: TextField(
//                       controller: _searchController,
//                       onChanged: _filterProfessionals,
//                       decoration: InputDecoration(
//                         hintText: 'Search item...',
//                         hintStyle: const TextStyle(color: Colors.grey),
//                         prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.tune, color: Colors.grey),
//                           onPressed: () {},
//                         ),
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Categories
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 _buildCategoryButton('Products'),
//                 const SizedBox(width: 12),
//                 _buildCategoryButton('Services'),
//                 const SizedBox(width: 12),
//                 _buildCategoryButton('Agencies'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Subcategories
//           if (subcategories.isNotEmpty)
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: subcategories
//                     .map(
//                       (item) => Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             side: BorderSide(
//                               color: selectedSubcategory == item ? const Color(0xFF004E98) : Colors.grey,
//                               width: 2,
//                             ),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                             backgroundColor: const Color(0xFFE2E2E2),
//                             foregroundColor: Colors.black,
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                           ),
//                           onPressed: () => _filterBySubcategory(item),
//                           child: Text(item, style: const TextStyle(fontWeight: FontWeight.w600)),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           const SizedBox(height: 20),
//           // Professionals List
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               children: filteredList.map((p) => JobCard(professional: p)).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchTab() {
//     return SingleChildScrollView(
//       child: Column(
//         children: filteredList.map((p) => JobCard(professional: p)).toList(),
//       ),
//     );
//   }

//   Widget _buildLikesTab() {
//     final liked = professionals.where((p) => p.isFavorite).toList();
//     return liked.isEmpty
//         ? const Center(child: Text("No favorites yet!"))
//         : SingleChildScrollView(
//             child: Column(children: liked.map((p) => JobCard(professional: p)).toList()),
//           );
//   }

//   Widget _buildProfileTab() {
//     return const Center(child: Text("Profile Tab"));
//   }

//   // Category button
//   Widget _buildCategoryButton(String text) {
//     final bool isSelected = selectedCategory == text;
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(color: isSelected ? const Color(0xFF004E98) : Colors.grey, width: 2),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         backgroundColor: const Color(0xFFE2E2E2),
//         foregroundColor: Colors.black,
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//       ),
//       onPressed: () => _filterByCategory(text),
//       child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
//     );
//   }
// }

// // ------------------ Job Card ------------------
// class JobCard extends StatefulWidget {
//   final Professional professional;
//   const JobCard({super.key, required this.professional});

//   @override
//   State<JobCard> createState() => _JobCardState();
// }

// class _JobCardState extends State<JobCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Card(
//           elevation: 3,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         widget.professional.image,
//                         height: 80,
//                         width: 80,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(widget.professional.title,
//                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                           Text(widget.professional.name),
//                           Text(widget.professional.price,
//                               style: const TextStyle(color: Color(0xFFFF6700), fontWeight: FontWeight.bold)),
//                           Row(
//                             children: [
//                               const Icon(Icons.location_pin, size: 14),
//                               const SizedBox(width: 4),
//                               Text(widget.professional.location),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFE2E2E2),
//                           foregroundColor: Colors.black,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         ),
//                         child: const Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF004E98),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         ),
//                         child: const Text('BOOK', style: TextStyle(fontWeight: FontWeight.bold)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 8,
//           right: 8,
//           child: IconButton(
//             icon: Icon(
//               widget.professional.isFavorite ? Icons.star : Icons.star_border,
//               color: const Color(0xFFFF6700),
//               size: 28,
//             ),
//             onPressed: () {
//               setState(() {
//                 widget.professional.isFavorite = !widget.professional.isFavorite;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
























// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'HomeHub',
//       theme: ThemeData(
//         useMaterial3: true,
//         brightness: Brightness.light,
//         fontFamily: 'Inter',
//         colorScheme: const ColorScheme.light(
//           primary: Color(0xFF004E98),
//           secondary: Color(0xFFFF6700),
//           surface: Colors.white,
//           background: Colors.white,
//           onSurface: Colors.black,
//           onBackground: Colors.black,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         cardColor: Colors.white,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// // ------------------- Professional Model ---------------------
// class Professional {
//   final String title;
//   final String name;
//   final String price;
//   final String location;
//   final String image;
//   final String category;
//   bool isFavorite;

//   Professional({
//     required this.title,
//     required this.name,
//     required this.price,
//     required this.location,
//     required this.image,
//     required this.category,
//     this.isFavorite = false,
//   });
// }

// // ------------------ Home Screen ------------------
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreen();
// }

// class _HomeScreen extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final List<String> servicesList = [
//     'Architects',
//     'Interior Design',
//     'Cleaning',
//     'Landscaping',
//     'Plumbing',
//   ];

//   final List<String> productsList = [
//     'Decoration',
//     'Furniture',
//     'Paints',
//     'Lighting',
//     'Tiles',
//     'Curtains',
//   ];

//   final TextEditingController _searchController = TextEditingController();

//   final List<Professional> professionals = [
//     Professional(
//       title: 'Architect',
//       name: 'Fatima Fatima',
//       price: '2000.0 DZD',
//       location: 'Mhalma, Sidi Abdallah',
//       image: 'images/architect.png',
//       category: 'Services',
//     ),
//     Professional(
//       title: 'Plumber',
//       name: 'Ali Ben',
//       price: '1500.0 DZD',
//       location: 'Bab Ezzouar, Algiers',
//       image: 'images/plumber.png',
//       category: 'Services',
//     ),
//     Professional(
//       title: 'Interior Designer',
//       name: 'Sara Kamel',
//       price: '3000.0 DZD',
//       location: 'Cheraga, Algiers',
//       image: 'images/design.png',
//       category: 'Services',
//     ),
//     Professional(
//       title: 'Paint',
//       name: 'ColorMax Store',
//       price: '1000.0 DZD',
//       location: 'Hydra, Algiers',
//       image: 'images/paint.png',
//       category: 'Products',
//     ),
//     Professional(
//       title: 'Furniture',
//       name: 'Modern Living',
//       price: '5000.0 DZD',
//       location: 'Ben Aknoun, Algiers',
//       image: 'images/furni.png',
//       category: 'Products',
//     ),
//   ];

//   List<Professional> filteredList = [];
//   String? selectedCategory;
//   String? selectedSubcategory;

//   @override
//   void initState() {
//     super.initState();
//     filteredList = professionals;
//   }

//   void _filterProfessionals(String query) {
//     final results = professionals.where((p) {
//       final title = p.title.toLowerCase();
//       final name = p.name.toLowerCase();
//       final search = query.toLowerCase();
//       return title.contains(search) || name.contains(search);
//     }).toList();

//     setState(() {
//       filteredList = results;
//       selectedCategory = null;
//       selectedSubcategory = null;
//     });
//   }

//   void _filterByCategory(String category) {
//     setState(() {
//       selectedCategory = category;
//       selectedSubcategory = null;
//       filteredList = professionals
//           .where((p) => p.category.toLowerCase() == category.toLowerCase())
//           .toList();
//     });
//   }

//   void _filterBySubcategory(String subcategory) {
//     setState(() {
//       selectedSubcategory = subcategory;
//       filteredList = professionals.where((p) {
//         return p.title.toLowerCase().contains(subcategory.toLowerCase());
//       }).toList();
//     });
//   }

//   void _onNavBarTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   List<Widget> get _pages => [
//     _buildHomeTab(),
//     _buildSearchTab(),
//     _buildLikesTab(),
//     _buildProfileTab(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1), // subtle shadow
//               blurRadius: 50,
//               offset: const Offset(0, -3),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(25),
//             topRight: Radius.circular(25),
//           ),
//           child: BottomNavigationBar(
//             elevation: 10, // extra elevation for subtle lift
//             currentIndex: _selectedIndex,
//             selectedItemColor: const Color(0xFFFF6700),
//             unselectedItemColor: Colors.grey,
//             backgroundColor: Colors.white,
//             type: BottomNavigationBarType.fixed,
//             onTap: _onNavBarTap,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home_rounded),
//                 label: '',
//               ),
//               BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
//               BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
//               BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ------------------ Tabs ------------------
//   Widget _buildHomeTab() {
//     List<String> subcategories = [];
//     if (selectedCategory == 'Services') subcategories = servicesList;
//     if (selectedCategory == 'Products') subcategories = productsList;

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 30),
//             width: double.infinity,
//             height: 300,
//             decoration: const BoxDecoration(
//               color: Color(0xFF004E98),
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 25,
//                             backgroundColor: Colors.white,
//                             child: Icon(
//                               Icons.person,
//                               size: 35,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Welcome Back',
//                                 style: TextStyle(
//                                   color: Color(0xFFFF6700),
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'Username',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const Icon(
//                         Icons.notifications_outlined,
//                         color: Color(0xFFFF6700),
//                         size: 30,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 75),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       controller: _searchController,
//                       onChanged: _filterProfessionals,
//                       decoration: InputDecoration(
//                         hintText: 'Search item...',
//                         hintStyle: const TextStyle(color: Colors.grey),
//                         prefixIcon: const Icon(
//                           CupertinoIcons.search,
//                           color: Colors.grey,
//                         ),
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.tune, color: Colors.grey),
//                           onPressed: () {},
//                         ),
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Categories
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 _buildCategoryButton('Products'),
//                 const SizedBox(width: 12),
//                 _buildCategoryButton('Services'),
//                 const SizedBox(width: 12),
//                 _buildCategoryButton('Agencies'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Subcategories
//           if (subcategories.isNotEmpty)
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: subcategories
//                     .map(
//                       (item) => Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             side: BorderSide(
//                               color: selectedSubcategory == item
//                                   ? const Color(0xFF004E98)
//                                   : Colors.grey,
//                               width: 2,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             backgroundColor: const Color(0xFFE2E2E2),
//                             foregroundColor: Colors.black,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 10,
//                             ),
//                           ),
//                           onPressed: () => _filterBySubcategory(item),
//                           child: Text(
//                             item,
//                             style: const TextStyle(fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           const SizedBox(height: 20),
//           // Professionals List
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               children: filteredList
//                   .map((p) => JobCard(professional: p))
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchTab() {
//     return SingleChildScrollView(
//       child: Column(
//         children: filteredList.map((p) => JobCard(professional: p)).toList(),
//       ),
//     );
//   }

//   Widget _buildLikesTab() {
//     final liked = professionals.where((p) => p.isFavorite).toList();
//     return liked.isEmpty
//         ? const Center(child: Text("No favorites yet!"))
//         : Padding(
//             padding: const EdgeInsets.only(top: 60),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: liked.map((p) => JobCard(professional: p)).toList(),
//               ),
//             ),
//           );
//   }

//   Widget _buildProfileTab() {
//     return const Center(child: Text("Profile Tab"));
//   }

//   // Category button
//   Widget _buildCategoryButton(String text) {
//     final bool isSelected = selectedCategory == text;
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(
//           color: isSelected ? const Color(0xFF004E98) : Colors.grey,
//           width: 2,
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         backgroundColor: const Color(0xFFE2E2E2),
//         foregroundColor: Colors.black,
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//       ),
//       onPressed: () => _filterByCategory(text),
//       child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
//     );
//   }
// }

// // ------------------ Job Card ------------------
// class JobCard extends StatefulWidget {
//   final Professional professional;
//   const JobCard({super.key, required this.professional});

//   @override
//   State<JobCard> createState() => _JobCardState();
// }

// class _JobCardState extends State<JobCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Card(
//           elevation: 3,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         widget.professional.image,
//                         height: 80,
//                         width: 80,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.professional.title,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           Text(widget.professional.name),
//                           Text(
//                             widget.professional.price,
//                             style: const TextStyle(
//                               color: Color(0xFFFF6700),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               const Icon(Icons.location_pin, size: 14),
//                               const SizedBox(width: 4),
//                               Text(widget.professional.location),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFE2E2E2),
//                           foregroundColor: Colors.black,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           'Details',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFFFFFFF),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF004E98),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           'BOOK',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 8,
//           right: 8,
//           child: IconButton(
//             icon: Icon(
//               widget.professional.isFavorite
//                   ? Icons.favorite
//                   : Icons.favorite_border,
//               color: const Color(0xFFFF6700),
//               size: 28,
//             ),
//             onPressed: () {
//               setState(() {
//                 widget.professional.isFavorite =
//                     !widget.professional.isFavorite;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
