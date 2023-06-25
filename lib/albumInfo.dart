import 'package:flutter/material.dart';

class AlbumInfo extends StatefulWidget {
  const AlbumInfo({super.key});
  @override
  State<AlbumInfo> createState() => _AlbumInfoState();
}

class _AlbumInfoState extends State<AlbumInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("album info"),
    );
  }
}
