import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/core/styles/dimen.dart';

@RoutePage()
class RoomScreen extends StatefulWidget {
  const RoomScreen({
    super.key,
    this.roomName = 'Untitled',
    this.password = '',
    this.maxPlayers = 5,
  });

  final String roomName;
  final String password;
  final int maxPlayers;

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final List<String> players = [
    'You',
  ];

  var maxPlayers = 5;
  var password = '';
  late var roomName = '';
  late final String roomId;
  var isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    roomId = generateRoomId();
    roomName = widget.roomName;
    password = widget.password;
    maxPlayers = widget.maxPlayers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.maybePop();
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                roomName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimen.smPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimen.smPadding,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimen.borderRadius),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Room ID',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '#$roomId',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: roomId));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Room ID copied to clipboard'),
                              ),
                            );
                          },
                          iconSize: 18,
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.copy),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _buildRoomSetting(context);
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              const SizedBox(height: Dimen.lgPadding),
              ElevatedButton(
                onPressed: players.length > maxPlayers || players.length < 5
                    ? null
                    : () {},
                child: Text(
                  players.length < maxPlayers
                      ? 'Waiting for players...'
                      : 'Start Game!',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              if (players.length > maxPlayers) ...[
                const SizedBox(height: Dimen.smPadding),
                Container(
                  padding: const EdgeInsets.all(Dimen.smPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(Dimen.borderRadius),
                  ),
                  child: const Text(
                    'Game cannot be started, player limit exceeded',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: Dimen.smPadding),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: Dimen.smPadding,
                    crossAxisSpacing: Dimen.smPadding,
                    childAspectRatio: 1,
                  ),
                  children: [
                    ...List.generate(
                      players.take(maxPlayers).length,
                      (index) => _buildPlayerCard(
                        players[index],
                      ),
                    ),
                    if (players.length > maxPlayers)
                      ...List.generate(
                        players.length - maxPlayers,
                        (index) => _buildPlayerCard(
                          players.skip(maxPlayers).toList()[index],
                          true,
                        ),
                      ),
                    if (players.length < maxPlayers)
                      ...List.generate(
                        maxPlayers - players.length,
                        (index) => _buildEmptyPlayerCard(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buildRoomSetting(BuildContext context) {
    showModalBottomSheet(
        context: context,
        scrollControlDisabledMaxHeightRatio: .9,
        builder: (_) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.all(Dimen.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Room Setting',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: Dimen.smPadding),
                    TextFormField(
                      initialValue: roomName,
                      decoration: const InputDecoration(
                        labelText: 'Room Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          roomName = value;
                        });
                      },
                    ),
                    const SizedBox(height: Dimen.smPadding),
                    TextFormField(
                      initialValue: password,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: !isPasswordVisible,
                      enableInteractiveSelection: false,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
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
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget _buildEmptyPlayerCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.borderRadius),
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimen.smPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CircleAvatar(
                foregroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 24,
                ),
              ),
            ),
            Text(
              '',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerCard(String playerName, [bool isError = false]) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.borderRadius),
        side: BorderSide(
          color: isError ? Colors.red : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimen.smPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: CircleAvatar(),
            ),
            Text(
              playerName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String generateRoomId() {
    var letterId = '';
    var numberId = '';
    for (int i = 0; i < 4; i++) {
      final randomLetterNumber = Random().nextInt(26);
      final letter = String.fromCharCode(65 + randomLetterNumber);
      letterId += letter;
      final randomIdNumber = Random().nextInt(9);
      numberId += randomIdNumber.toString();
    }
    final roomId = '$letterId-$numberId';
    return roomId;
  }
}
