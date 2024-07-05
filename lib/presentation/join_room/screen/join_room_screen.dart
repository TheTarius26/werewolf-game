import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/route/route_config.dart';
import 'package:myapp/core/styles/dimen.dart';

@RoutePage()
class JoinRoomScreen extends StatelessWidget {
  const JoinRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Join Room'),
              const SizedBox(height: Dimen.padding),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Room ID',
                ),
              ),
              const SizedBox(height: Dimen.padding),
              ElevatedButton(
                onPressed: () {
                  context.pushRoute(RoomRoute());
                },
                child: const Text('Join Room'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
