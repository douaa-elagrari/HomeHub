import 'package:flutter/material.dart';
import '../widgets/job_card.dart';
import '../models/professional.dart';

class LikesScreen extends StatelessWidget {
  final List<Professional> favorites;

  const LikesScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? const Center(child: Text("No favorites yet!"))
        : Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                children:
                    favorites.map((p) => JobCard(professional: p)).toList(),
              ),
            ),
          );
  }
}
