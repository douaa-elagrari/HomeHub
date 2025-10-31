// import 'package:flutter/material.dart';
// import '../data/dummy_data.dart';
// import '../models/professional.dart';
// import '../models/product.dart';
// import '../models/agency.dart';
// import '../widgets/job_card.dart';
// import '../widgets/product_card.dart';
// import '../widgets/agency_card.dart';
// import '../models/saved_item.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final TextEditingController _searchController = TextEditingController();

//   String selectedCategory = "Services";
//   String? selectedSubcategory;

//   List<dynamic> filteredList = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredList = services; // default category
//   }

//   // ------------------------- SEARCH -------------------------
//   void _filterSearch(String query) {
//     if (selectedCategory == "Services") {
//       filteredList = services
//           .where(
//             (s) =>
//                 s.title.toLowerCase().contains(query.toLowerCase()) ||
//                 s.name.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     } else if (selectedCategory == "Products") {
//       filteredList = products
//           .where(
//             (p) =>
//                 p.name.toLowerCase().contains(query.toLowerCase()) ||
//                 p.price.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     } else {
//       filteredList = agencies
//           .where(
//             (a) =>
//                 a.title.toLowerCase().contains(query.toLowerCase()) ||
//                 a.location.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     }

//     setState(() {});
//   }

//   // ------------------------- CATEGORY SWITCH -------------------------
//   void _setCategory(String category) {
//     selectedCategory = category;
//     selectedSubcategory = null;

//     if (category == "Products") {
//       filteredList = products;
//     } else if (category == "Services") {
//       filteredList = services;
//     } else {
//       filteredList = agencies;
//     }

//     setState(() {});
//   }

//   // ------------------------- NAVIGATION BAR -------------------------
//   void _onNavBarTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   List<Widget> get pages => [
//     // Home tab: simple placeholder
//     const Center(
//       child: Text(
//         "Home",
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     ),

//     _buildHomeTab(),

//     _buildLikesTab(),
//     _buildProfileTab(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFFFF6700),
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Colors.white,
//         onTap: _onNavBarTap,
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//       ),
//     );
//   }

//   // ------------------------- HOME TAB -------------------------
//   Widget _buildHomeTab() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           _header(),

//           const SizedBox(height: 20),

//           // CATEGORY BUTTONS
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _categoryBtn("Services"),
//               const SizedBox(width: 12),
//               _categoryBtn("Products"),
//               const SizedBox(width: 12),
//               _categoryBtn("Agencies"),
//             ],
//           ),

//           const SizedBox(height: 20),

//           // LIST OF ITEMS
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: selectedCategory == "Products"
//                 ? _buildProductGrid()
//                 : selectedCategory == "Services"
//                 ? Column(
//                     children: filteredList
//                         .map((p) => JobCard(professional: p))
//                         .toList(),
//                   )
//                 : Column(
//                     children: filteredList
//                         .map((a) => AgencyCard(agency: a))
//                         .toList(),
//                   ),
//           ),

//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   // ------------------------- PRODUCT GRID -------------------------
//   Widget _buildProductGrid() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: filteredList.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisExtent: 250,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (_, i) => ProductCard(product: filteredList[i]),
//     );
//   }

//   // ------------------------- SEARCH TAB -------------------------
//   Widget _buildSearchTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: filteredList.map((item) {
//           if (item is Professional) return JobCard(professional: item);
//           if (item is Product) return ProductCard(product: item);
//           return AgencyCard(agency: item);
//         }).toList(),
//       ),
//     );
//   }

//   // ------------------------- LIKES TAB -------------------------
//   Widget _buildLikesTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.only(top: 90, left: 16, right: 16, bottom: 20),
//       child: likedItems.isEmpty
//           ? const Center(child: Text("No favorites yet!"))
//           : Column(
//               children: likedItems.map((saved) {
//                 if (saved.type == SavedType.product) {
//                   return ProductCard(product: saved.item as Product);
//                 }
//                 if (saved.type == SavedType.service) {
//                   return JobCard(professional: saved.item as Professional);
//                 }
//                 return AgencyCard(agency: saved.item as Agency);
//               }).toList(),
//             ),
//     );
//   }

//   Widget _buildProfileTab() {
//     return const Center(child: Text("Profile Tab"));
//   }

//   // ------------------------- CATEGORY BUTTON -------------------------
//   Widget _categoryBtn(String text) {
//     bool selected = selectedCategory == text;

//     return OutlinedButton(
//       onPressed: () => _setCategory(text),
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(
//           color: selected ? const Color(0xFF004E98) : Colors.grey,
//           width: 2,
//         ),
//         backgroundColor: const Color(0xFFE2E2E2),
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }

//   // ------------------------- HEADER -------------------------
//   Widget _header() {
//     return Container(
//       width: double.infinity,
//       height: 280,
//       decoration: const BoxDecoration(
//         color: Color(0xFF004E98),
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // WELCOME
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: const [
//                       CircleAvatar(
//                         radius: 25,
//                         backgroundColor: Colors.white,
//                         child: Icon(Icons.person, size: 35, color: Colors.grey),
//                       ),
//                       SizedBox(width: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome Back",
//                             style: TextStyle(
//                               color: Color(0xFFFF6700),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Username",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Icon(
//                     Icons.notifications_outlined,
//                     size: 30,
//                     color: Color(0XFFFF6700),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 60),

//             // SEARCH BAR
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.15),
//                     blurRadius: 6,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: _filterSearch,
//                 decoration: InputDecoration(
//                   hintText: "Search...",
//                   prefixIcon: const Icon(Icons.search, color: Colors.grey),

//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.tune, color: Colors.grey),
//                     onPressed: () {},
//                   ),

//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/professional.dart';
import '../models/product.dart';
import '../models/agency.dart';
import '../widgets/job_card.dart';
import '../widgets/product_card.dart';
import '../widgets/agency_card.dart';
import '../models/saved_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  String selectedCategory = "Services";
  String? selectedSubcategory;

  List<dynamic> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = services; // default category
  }

  // ------------------------- SEARCH -------------------------
  void _filterSearch(String query) {
    if (selectedCategory == "Services") {
      filteredList = services
          .where(
            (s) =>
                s.title.toLowerCase().contains(query.toLowerCase()) ||
                s.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else if (selectedCategory == "Products") {
      filteredList = products
          .where(
            (p) =>
                p.name.toLowerCase().contains(query.toLowerCase()) ||
                p.price.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } else {
      filteredList = agencies
          .where(
            (a) =>
                a.title.toLowerCase().contains(query.toLowerCase()) ||
                a.location.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    setState(() {});
  }

  // ------------------------- CATEGORY SWITCH -------------------------
  void _setCategory(String category) {
    selectedCategory = category;
    selectedSubcategory = null;

    if (category == "Products") {
      filteredList = products;
    } else if (category == "Services") {
      filteredList = services;
    } else {
      filteredList = agencies;
    }

    setState(() {});
  }

  // ------------------------- NAVIGATION BAR -------------------------
  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get pages => [
    const Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    _buildHomeTab(),
    _buildLikesTab(),
    _buildLibraryTab(),
    _buildProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFF6700),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onNavBarTap,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: ''),
        ],
      ),
    );
  }

  // ------------------------- HOME TAB -------------------------
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _header(),

          const SizedBox(height: 20),

          // CATEGORY BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryBtn("Services"),
              const SizedBox(width: 12),
              _categoryBtn("Products"),
              const SizedBox(width: 12),
              _categoryBtn("Agencies"),
            ],
          ),

          const SizedBox(height: 20),

          // LIST OF ITEMS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: selectedCategory == "Products"
                ? _buildProductGrid()
                : selectedCategory == "Services"
                ? Column(
                    children: filteredList
                        .map((p) => JobCard(professional: p))
                        .toList(),
                  )
                : Column(
                    children: filteredList
                        .map((a) => AgencyCard(agency: a))
                        .toList(),
                  ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ------------------------- PRODUCT GRID -------------------------
  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, i) => ProductCard(product: filteredList[i]),
    );
  }

  // ------------------------- LIKES TAB -------------------------
  Widget _buildLikesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 90, left: 16, right: 16, bottom: 20),
      child: likedItems.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : Column(
              children: likedItems.map((saved) {
                if (saved.type == SavedType.product) {
                  return ProductCard(product: saved.item as Product);
                }
                if (saved.type == SavedType.service) {
                  return JobCard(professional: saved.item as Professional);
                }
                return AgencyCard(agency: saved.item as Agency);
              }).toList(),
            ),
    );
  }

  Widget _buildLibraryTab() {
    return const Center(
      child: Text(
        "Library",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProfileTab() {
    return const Center(child: Text("Profile Tab"));
  }

  // ------------------------- CATEGORY BUTTON -------------------------
  Widget _categoryBtn(String text) {
    bool selected = selectedCategory == text;

    return OutlinedButton(
      onPressed: () => _setCategory(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: selected ? const Color(0xFF004E98) : Colors.grey,
          width: 2,
        ),
        backgroundColor: const Color(0xFFE2E2E2),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  // ------------------------- HEADER -------------------------
  Widget _header() {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: const BoxDecoration(
        // color: Color(0xFF004E98),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF004E98), Color.fromARGB(250, 4, 50, 96)],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person_rounded,
                          size: 35,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              color: Color(0xFFFF6700),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        size: 30,
                        color: Colors.white,
                      ),

                      Positioned(
                        right: 4,
                        top: -2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF6700),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // SEARCH BAR
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSearch,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune_rounded, color: Colors.grey),
                    onPressed: () {},
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
