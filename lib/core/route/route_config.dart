import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/create_room/screen/create_room_screen.dart';
import 'package:myapp/presentation/home/screen/home_screen.dart';
import 'package:myapp/presentation/join_room/screen/join_room_screen.dart';
import 'package:myapp/presentation/room/screen/room_screen.dart';

part 'route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRoute extends _$AppRoute {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: JoinRoomRoute.page),
        AutoRoute(page: CreateRoomRoute.page),
        AutoRoute(page: RoomRoute.page),
      ];
}
