import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../viewmodels/wish_list_view_model.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('İstek Listesi'),
      ),
    );
  }
}
