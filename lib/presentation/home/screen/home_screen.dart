import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/route/route_config.dart';
import 'package:myapp/core/styles/dimen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Werewolf Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimen.padding),
              OutlinedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Join Room'),
                onPressed: () {
                  context.pushRoute(const JoinRoomRoute());
                },
              ),
              const SizedBox(height: Dimen.smPadding),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Create Room'),
                onPressed: () {
                  context.pushRoute(const CreateRoomRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
