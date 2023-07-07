import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? nameOfWorkout;
  final VoidCallback? onDelete;

  const WorkoutCard({
    super.key,
    this.imagePath,
    this.title,
    this.nameOfWorkout,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: imagePath != null && imagePath!.isNotEmpty
            ? Image.network(imagePath!)
            : const Icon(Icons
                .image), // Fallback image (can be replaced with any other widget)
        title: Text(title ?? ''),
        subtitle: Text(nameOfWorkout ?? ''),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
