import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return AppBar(
      automaticallyImplyLeading: false, // optional
      title: Row(
        children: [
          Icon(Icons.movie_outlined, color: colors.primary),
          const SizedBox(width: 5),
          Text('Moviepedia', style: titleStyle),
          const Spacer(),
          IconButton(
            onPressed: () {
              // implement search
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  // ✅ Required when implementing PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
