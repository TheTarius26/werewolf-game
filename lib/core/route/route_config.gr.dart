// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route_config.dart';

abstract class _$AppRoute extends RootStackRouter {
  // ignore: unused_element
  _$AppRoute({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateRoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateRoomScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    JoinRoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinRoomScreen(),
      );
    },
    RoomRoute.name: (routeData) {
      final args =
          routeData.argsAs<RoomRouteArgs>(orElse: () => const RoomRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RoomScreen(
          key: args.key,
          roomName: args.roomName,
          password: args.password,
          maxPlayers: args.maxPlayers,
        ),
      );
    },
  };
}

/// generated route for
/// [CreateRoomScreen]
class CreateRoomRoute extends PageRouteInfo<void> {
  const CreateRoomRoute({List<PageRouteInfo>? children})
      : super(
          CreateRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoomRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinRoomScreen]
class JoinRoomRoute extends PageRouteInfo<void> {
  const JoinRoomRoute({List<PageRouteInfo>? children})
      : super(
          JoinRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinRoomRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoomScreen]
class RoomRoute extends PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    Key? key,
    String roomName = 'Untitled',
    String password = '',
    int maxPlayers = 5,
    List<PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            roomName: roomName,
            password: password,
            maxPlayers: maxPlayers,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<RoomRouteArgs> page = PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    this.roomName = 'Untitled',
    this.password = '',
    this.maxPlayers = 5,
  });

  final Key? key;

  final String roomName;

  final String password;

  final int maxPlayers;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, roomName: $roomName, password: $password, maxPlayers: $maxPlayers}';
  }
}
