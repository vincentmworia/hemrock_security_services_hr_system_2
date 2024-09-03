import 'package:flutter/material.dart';

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0)),
        child: Container(
          color: appSecondaryColor2,
        ));
  }
}
