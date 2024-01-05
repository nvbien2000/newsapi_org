import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleWidget extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final DateTime? publishedDate;
  final String? description;
  final String? source;
  final bool isNeedToShowSource;

  const ArticleWidget({
    super.key,
    this.title,
    this.imageUrl,
    this.publishedDate,
    this.description,
    this.source,
    required this.isNeedToShowSource,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "No title",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          imageUrl != null ? Image.network(imageUrl!) : const SizedBox.shrink(),
          const SizedBox(height: 10),
          description == null ? const SizedBox.shrink() : Text(description!),
          _buildDateTime(),
          _buildSource(),
        ],
      ),
    );
  }

  Widget _buildDateTime() {
    if (publishedDate == null) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
        DateFormat('dd/MMM/yyyy – HH:MM').format(publishedDate!),
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildSource() {
    if (source == null || isNeedToShowSource == false) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
        "Source: $source",
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }
}
