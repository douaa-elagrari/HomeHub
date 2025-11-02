import '../utils/imports.dart';

class SearchScreen extends StatelessWidget {
  final List<Professional> filtered;

  const SearchScreen({super.key, required this.filtered});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: filtered.map((p) => JobCard(professional: p)).toList(),
      ),
    );
  }
}
