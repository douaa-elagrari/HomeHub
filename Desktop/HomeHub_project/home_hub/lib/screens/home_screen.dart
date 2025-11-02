import 'package:flutter/cupertino.dart';
import '../utils/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> servicesList = [
    'Architects',
    'Interior Design',
    'Cleaning',
    'Landscaping',
    'Plumbing',
  ];

  final List<String> productsList = [
    'Decoration',
    'Furniture',
    'Paints',
    'Lighting',
    'Tiles',
    'Curtains',
  ];

  final TextEditingController _searchController = TextEditingController();

  List<Professional> filteredList = [];
  String? selectedCategory;
  String? selectedSubcategory;

  @override
  void initState() {
    super.initState();
    filteredList = professionals;
  }

  // ---------------- FILTERS ----------------
  void _filterProfessionals(String query) {
    final results = professionals.where((p) {
      final title = p.title.toLowerCase();
      final name = p.name.toLowerCase();
      final search = query.toLowerCase();
      return title.contains(search) || name.contains(search);
    }).toList();

    setState(() {
      filteredList = results;
      selectedCategory = null;
      selectedSubcategory = null;
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      selectedSubcategory = null;
      filteredList = professionals
          .where((p) => p.category.toLowerCase() == category.toLowerCase())
          .toList();
    });
  }

  void _filterBySubcategory(String subcategory) {
    setState(() {
      selectedSubcategory = subcategory;
      filteredList = professionals.where((p) {
        return p.title.toLowerCase().contains(subcategory.toLowerCase());
      }).toList();
    });
  }

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ---------------- PAGES ----------------
  List<Widget> get _pages => [
    _buildHomeTab(),
    _buildSearchTab(),
    _buildLikesTab(),
    Myprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ensure scaffold is white
      body: Container(
        color: Colors.white, // ensure body is white
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // bottom nav background white
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 50,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            elevation: 10,
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFFFF6700),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white, // nav bar itself white
            type: BottomNavigationBarType.fixed,
            onTap: _onNavBarTap,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- HOME TAB ----------------
  Widget _buildHomeTab() {
    List<String> subcategories = [];
    if (selectedCategory == 'Services') subcategories = servicesList;
    if (selectedCategory == 'Products') subcategories = productsList;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Blue header area
          HeaderArea(
            searchController: _searchController,
            onSearchChanged: _filterProfessionals,
          ),

          const SizedBox(height: 20),

          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildCategoryButton('Products'),
                const SizedBox(width: 12),
                _buildCategoryButton('Services'),
                const SizedBox(width: 12),
                _buildCategoryButton('Agencies'),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Subcategories
          if (subcategories.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: subcategories
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: selectedSubcategory == item
                                  ? const Color(0xFF004E98)
                                  : Colors.grey,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFFE2E2E2),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () => _filterBySubcategory(item),
                          child: Text(
                            item,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

          const SizedBox(height: 20),

          // Professionals List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: filteredList
                  .map((p) => JobCard(professional: p))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- SEARCH TAB ----------------
  Widget _buildSearchTab() {
    return SingleChildScrollView(
      child: Column(
        children: filteredList.map((p) => JobCard(professional: p)).toList(),
      ),
    );
  }

  // ---------------- LIKES TAB ----------------
  Widget _buildLikesTab() {
    final liked = professionals.where((p) => p.isFavorite).toList();
    return liked.isEmpty
        ? const Center(child: Text("No favorites yet!"))
        : Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                children: liked.map((p) => JobCard(professional: p)).toList(),
              ),
            ),
          );
  }

  // ---------------- PROFILE TAB ----------------
  //call the widget Myprofile from myprofile.dart

  // ---------------- CATEGORY BUTTON ----------------
  Widget _buildCategoryButton(String text) {
    final bool isSelected = selectedCategory == text;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: isSelected ? const Color(0xFF004E98) : Colors.grey,
          width: 2,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xFFE2E2E2),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
      onPressed: () => _filterByCategory(text),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
