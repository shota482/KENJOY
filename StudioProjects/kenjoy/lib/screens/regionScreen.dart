import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import '../models/region.dart';
import '../models/prefecture.dart';
import '../models/urls.dart';
// モデルをインポート
import 'prefectureScreen.dart';


class RegionListPage extends StatefulWidget {
  const RegionListPage({super.key});

  @override
  State<RegionListPage> createState() => _RegionListPageState();
}

class _RegionListPageState extends State<RegionListPage> {
  List<Region> regions = [];
  List<Prefecture> prefectures = [];
  bool isLoading = true;


  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const regionUrl = Urls.RegionUrl;
    const prefUrl = Urls.PrefUrl;
    try {
      final regionResponse = await http.get(Uri.parse(regionUrl));
      final prefResponse = await http.get(Uri.parse(prefUrl));

      if (regionResponse.statusCode == 200&& prefResponse.statusCode == 200) {
        final List<dynamic> regionJson = jsonDecode(regionResponse.body);
        final List<dynamic> prefJson = jsonDecode(prefResponse.body);
        setState(() {
          regions = regionJson.map((json) => Region.fromJson(json)).toList();
          prefectures = prefJson.map((json) => Prefecture.fromJson(json)).toList();
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
            color: Colors.blue,
            child: ListView(
                    children: [
                      ...regions.map((region){
                        return ExpansionTile(
                          title: Text(
                            '${region.name}地方',
                            style: TextStyle(
                              fontSize: 20
                              ),r
                            ),
                          children: [
                            ...prefectures.where((p) => p.region_id == region.id)
                            .map((p) =>
                            SizedBox(
                              child:  Card(child: Center(child: Text('${p.name}'))),
                              height: 50,
                              width : 90
                            ))
                          ],
                        );
                      },),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text('決定',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.red
                            ),
                          ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(10, 50)
                        ),
                      ),
                    ],
            ),
          ),
    );
  }
}


