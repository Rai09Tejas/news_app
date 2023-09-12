import 'package:flutter/material.dart';
import 'package:quantum_task/utils/models/newsModel.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constants.dart';

class CustomNewsListItem extends StatelessWidget {
  final NewsModal newsItem;

  const CustomNewsListItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        trailing: Image.network(
          newsItem.urlToImage ?? dummyImage,
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.network(
            dummyImage,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          children: [
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  timeago.format(
                    DateTime.now().subtract(
                      Duration(
                          milliseconds: DateTime.now().millisecondsSinceEpoch -
                              DateTime.parse(newsItem.publishedAt ?? "")
                                  .millisecondsSinceEpoch),
                    ),
                  ),
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Text(
                  "  ${newsItem.source['name']}",
                  style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              newsItem.title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
        subtitle: Text(
          newsItem.description ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
