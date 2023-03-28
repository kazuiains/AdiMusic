import 'package:flutter/material.dart';
import 'package:musik/app/utils/helper/setting_helper.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  ValueChanged<String>? onChanged;

  CustomSearchDelegate({
    this.onChanged,
  });

  List<String> searchTerms = SettingHelper.getKeywordList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          if (onChanged != null) {
            onChanged!(query);
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  void showResults(BuildContext context) {
    SettingHelper.saveKeyword(query);
    close(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (onChanged != null) {
      onChanged!(query);
    }

    List<String> matchQuery = [];
    for (var keyword in searchTerms) {
      if (keyword.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(keyword);
      }
    }
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            onTap: () => close(context, result),
            title: Text(result),
          );
        },
      ),
    );
  }
}
