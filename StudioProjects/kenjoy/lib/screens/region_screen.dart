import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:kenjoy/screens/page1.dart';

import '../models/prefecture_json.dart';
import '../models/region.dart';
import '../models/urls.dart';

class RegionListPage extends StatefulWidget {
  const RegionListPage({super.key});

  static const path = '/Region';

  @override
  State<RegionListPage> createState() => _RegionListPageState();
}

class _RegionListPageState extends State<RegionListPage> {
  List<Region> regions = [];
  List<Prefecture> prefectures = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const regionUrl = Urls.RegionUrl;
    const prefUrl = Urls.PrefUrl;
    try {
      final regionResponse = await http.get(Uri.parse(regionUrl));
      final prefResponse = await http.get(Uri.parse(prefUrl));

      if (regionResponse.statusCode == 200 && prefResponse.statusCode == 200) {
        final List<dynamic> regionJson = jsonDecode(regionResponse.body);
        final List<dynamic> prefJson = jsonDecode(prefResponse.body);
        setState(() {
          regions = regionJson.map((json) => Region.fromJson(json)).toList();
          prefectures =
              prefJson.map((json) => Prefecture.fromJson(json)).toList();
          isLoading = false;
          debugPrint('Success load regions: ${regionResponse.statusCode}');
          debugPrint('Region response body: ${regionResponse.body}');
          debugPrint('Pref response body: ${prefResponse.body}');
        });
      } else {
        setState(() {
          isLoading = false;
        });
        debugPrint('Region status: ${regionResponse.statusCode}');
        debugPrint('Region response body: ${regionResponse.body}');
        debugPrint('Prefecture status: ${prefResponse.statusCode}');
        debugPrint('Pref response body: ${prefResponse.body}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error fetching regions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Region_screen')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                children: [
                  ...regions.map(
                    (region) {
                      return ExpansionTile(
                        title: Text(
                          '${region.name}地方',
                          style: TextStyle(fontSize: 20),
                        ),
                        children: [
                          ...prefectures
                              .where((p) => p.region_id == region.id)
                              .map((p) => SizedBox(
                                  height: 50,
                                  width: 90,
                                  child: Card(
                                      child: Center(
                                          child: Text(
                                    '${p.name}県',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ))))),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () => GoRouter.of(context).push(Page1.path),
              // アクションを記述
              child: Text("決定"),
            ),
          ),
        ],
      ),
    );
  }
}
