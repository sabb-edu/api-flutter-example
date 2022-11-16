import 'package:api_example_flutter/app/modules/bible/models/book_model.dart';
import 'package:api_example_flutter/app/modules/bible/repositories/bible_repository.dart';
import 'package:flutter/material.dart';

class BiblePage extends StatefulWidget {
  const BiblePage({super.key});

  @override
  State<BiblePage> createState() => _BiblePageState();
}

class _BiblePageState extends State<BiblePage> {
  List<BookModel> books = [];

  bool isLoading = false;

  void load() async {
    setState(() {
      isLoading = true;
    });
    final items = await BibleRepository.getAllBooks();

    setState(() {
      isLoading = false;

      books = items;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {},
                title: Text(
                  books[index].name,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Capitulos: ${books[index].chapters} '),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Author: ${books[index].author} '),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Grupo: ${books[index].group} '),
                  ],
                ),
              ),
            ),
    );
  }
}
