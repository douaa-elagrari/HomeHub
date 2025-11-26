import 'package:flutter/material.dart';
import '../../widgets/home_header.dart';
import '../../widgets/custom_bottom_nav_pro.dart';

class DocumentationScreen extends StatefulWidget {
  const DocumentationScreen({super.key});

  @override
  State<DocumentationScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DocumentationScreen> {
  // int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Amina Benhmed",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Santa-cruz -31",
      "description": "Yacine Talbi",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Dalia Lili",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Santa-cruz -31",
      "description": "Samia Hachour",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Alia Hamadouch",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Santa-cruz -31",
      "description": "Samir kachour",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Ahmed Ali",
    },
    {
      "image": "assets/images/santa_cruz.png",
      "title": "Santa-cruz -31",
      "description": "Hassiba Ben",
    },
    {
      "image": "assets/images/memorial_of_martyr.png",
      "title": "Santa-cruz -31",
      "description": "Lilia Salem",
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HomeHeader(searchController: _searchController, onSearch: (value) {}),

          // Grid of cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Rounded image
                        Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(item["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Title
                        Text(
                          item["title"]!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        // Description
                        Text(
                          item["description"]!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: CustomBottomNavBar(
      //   selectedIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: DocumentationScreen(),
//   ));
// }
