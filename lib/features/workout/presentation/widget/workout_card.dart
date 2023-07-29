import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? nameOfWorkout;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? follow;

  const WorkoutCard({
    super.key,
    this.imagePath,
    this.title,
    this.nameOfWorkout,
    this.onDelete,
    this.onEdit,
    this.follow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: imagePath != null && imagePath!.isNotEmpty
            ? Image.network(imagePath!)
            : const Icon(Icons.image),
        title: Text(title ?? ''),
        // subtitle: Text(nameOfWorkout ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: follow,
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
