import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/route/route_config.dart';
import 'package:myapp/core/styles/dimen.dart';

@RoutePage()
class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final passwordStreamController = StreamController<bool>();

  final roomNameController = TextEditingController();
  final passwordController = TextEditingController();

  var maxPlayers = 5;

  @override
  void dispose() {
    passwordStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.padding),
          child: ListView(
            children: [
              const Text(
                'Create Room',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimen.smPadding),
              TextField(
                controller: roomNameController,
                decoration: const InputDecoration(
                  labelText: 'Room Name',
                ),
              ),
              const SizedBox(height: Dimen.smPadding),
              StreamBuilder<bool>(
                  stream: passwordStreamController.stream,
                  initialData: true,
                  builder: (context, snapshot) {
                    final isVisible = snapshot.data!;
                    return TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffix: IconButton(
                          onPressed: () {
                            passwordStreamController.add(!isVisible);
                          },
                          icon: Icon(
                            !isVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: isVisible,
                    );
                  }),
              const SizedBox(height: Dimen.smPadding),
              Row(
                children: [
                  const Text(
                    'Max Players',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      if (maxPlayers == 5) return;
                      setState(() {
                        maxPlayers--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    maxPlayers.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (maxPlayers == 30) return;
                      setState(() {
                        maxPlayers++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: Dimen.smPadding),
              ElevatedButton(
                onPressed: () {
                  context.pushRoute(RoomRoute(
                    roomName: roomNameController.text,
                    password: passwordController.text,
                    maxPlayers: maxPlayers,
                  ));
                },
                child: const Text('Create Room'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
