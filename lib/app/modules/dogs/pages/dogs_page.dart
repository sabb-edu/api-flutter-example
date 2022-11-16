import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  String? link;

  Future<void> gerarImagem() async {
    print('Começou a pegar os dados...');
    final client = Dio();
    final result = await client.get(
      'https://dog.ceo/api/breeds/image/random',
    );
    print('Pegou os dados...');
    print(result.data.toString());

    setState(() {
      link = result.data['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOGS'),
      ),
      body: Column(
        children: [
          if (link != null) Image.network(link!),
          ElevatedButton(
            onPressed: gerarImagem,
            child: const Text(
              'Gerar image',
            ),
          ),
        ],
      ),
    );
  }
}
