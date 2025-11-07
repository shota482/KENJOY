import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordSummaryCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final String pref;
  final String? imageUrl;
  final VoidCallback? onTap;

  const RecordSummaryCard({
    super.key,
    required this.title,
    required this.date,
    required this.pref,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy/MM/dd').format(date);
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            //TODO image from URL & fix size from screen size
            Icon(
              Icons.photo_size_select_actual_outlined,
              size: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            pref,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(formattedDate),
                        )
                      ],
                    ),
                    const SizedBox(height: 6,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _buildTag("タグ"),
                        _buildTag("温泉旅行"),
                        _buildTag("タグ"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTag(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.orange.shade50,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.orange.shade200),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 13, color: Colors.orange),
    ),
  );
}
