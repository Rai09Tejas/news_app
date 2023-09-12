import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum_task/providers/auth_provider.dart';
import 'package:quantum_task/providers/main_provider.dart';
import 'package:quantum_task/widgets/custom_list_tile.dart';

import '../utils/models/newsModel.dart';

class HomeScreen extends StatefulWidget {
  static const String tag = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = ''; // To store the search text

  @override
  void initState() {
    super.initState();
    Provider.of<MainProvider>(context, listen: false).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (_, mainProvider, __) {
      List<NewsModal> newsList = mainProvider.newsList;
      List<NewsModal> filteredNewsList = searchText.isEmpty
          ? newsList
          : newsList.where((news) {
              return news.title!
                      .toLowerCase()
                      .contains(searchText.toLowerCase()) ||
                  news.description!
                      .toLowerCase()
                      .contains(searchText.toLowerCase());
            }).toList();

      return Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .logout(context);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildSearchWidget(),
              ),
              Positioned(
                  top: 60, // Adjust the top position as needed
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildNewsList(filteredNewsList))
            ],
          ),
        ),
      );
    });
  }

  _buildNewsList(List<NewsModal> newsList) {
    return ListView.builder(
      itemCount: newsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        print(newsList[index]);
        return CustomNewsListItem(newsItem: newsList[index]);
      },
    );
  }

  Widget _buildSearchWidget() {
    return Card(
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search in feed...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
