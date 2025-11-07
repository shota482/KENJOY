import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/prefecture.dart';

class PrefectureListPage extends StatefulWidget {
  final int regionId;
  const PrefectureListPage({super.key, required this.regionId});

  @override
  State<PrefectureListPage> createState() => _PrefectureListPageState();
}

class _PrefectureListPageState extends State<PrefectureListPage> {
  List<Prefecture> prefectures = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrefectures();
  }

  Future<void> fetchPrefectures() async {
    final url = 'http://10.0.2.2:8000/api/prefectures/region/${widget.regionId}/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          prefectures = data.map((json) => Prefecture.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        debugPrint('Failed to load prefectures: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching prefectures: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prefectures')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: prefectures.length,
        itemBuilder: (context, index) {
          final p = prefectures[index];
          return ListTile(
            title: Text(p.name),
          );
        },
      ),
    );
  }
}