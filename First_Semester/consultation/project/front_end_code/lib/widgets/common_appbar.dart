import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    // final theme = Theme.of(context);
    // final textScaleFactor = mediaQuery.textScaleFactor;
    return AppBar(
      actionsIconTheme: const IconThemeData(color: Colors.amber),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),

        // circular avatar contains text to sign in
        GestureDetector(
          onTap: () {
            //! TODO: implement sign in
            print('Sign in');
          },
          child: Container(
            margin: const EdgeInsets.only(right: 30),
            // it should be rounded
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background,
            ),
            child: const Text(
              'Log In',
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
          ),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Row(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(
          child: Image.asset(
            './assets/imgs/epl-logo.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style:
              const TextStyle(color: Colors.amber, fontFamily: 'RubikBubbles'),
        )
      ]),
      centerTitle: true,
    );
  }
}
