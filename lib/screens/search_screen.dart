import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:vietravel/locator.dart';
import 'package:vietravel/models/article_model.dart';
import 'package:vietravel/repositories/news_repo.dart';
import 'package:vietravel/screens/widgets/listview_articles_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  final TextEditingController _searchController = TextEditingController();

  /// - null: not searching
  /// - true/false: searching
  final ValueNotifier<bool?> _isSearchingNotifier = ValueNotifier<bool?>(null);

  @override
  void dispose() {
    _searchController.dispose();
    _isSearchingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Column(
        children: [
          _buildTextFieldSearch(),
          Expanded(child: _buildListSearchedArticles()),
        ],
      ),
    );
  }

  Widget _buildTextFieldSearch() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SimpleAutoCompleteTextField(
        key: key,
        controller: _searchController,
        suggestions: const ['Vietravel', 'Apple', 'Bitcoin'],
        clearOnSubmit: false,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textSubmitted: (value) {
          if (value.isNotEmpty) {
            _isSearchingNotifier.value = !(_isSearchingNotifier.value ?? false);
          }
        },
      ),
    );
  }

  Widget _buildListSearchedArticles() {
    return ValueListenableBuilder<bool?>(
      valueListenable: _isSearchingNotifier,
      builder: (context, value, child) {
        if (value != null) {
          return FutureBuilder(
            future: getIt.get<NewsRepository>().search(_searchController.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListViewArticleWidget(
                  articles: snapshot.data as List<ArticleModel>,
                  isNeedToShowSource: true,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        } else {
          return const Center(
            child: Text('Search articles'),
          );
        }
      },
    );
  }
}
