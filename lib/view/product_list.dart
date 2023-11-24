import 'package:crud01/model/product.dart';
import 'package:crud01/view/form_product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Add margem
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: produtos.map((produto) {
                return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.api_rounded),
                    title: Text(
                      'Produto: ${produto.name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      // Formatação para exibir o preço com duas casas decimais
                      'R\$ ${produto.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0)
            ),
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final novoProduto = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormProduct(),
                  ),
                );

                if (novoProduto != null) {
                  setState(() {
                    produtos.add(novoProduto);
                  });
                }
              },
              child: const Text('Adicionar Produto'),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
