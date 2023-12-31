import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_finder/providers/auth_provider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    ref.read(authProvider.notifier).setUser();

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user_rounded,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              user?.username ?? '',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
    );
  }
}
