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

          // Botao com func para ir a pagina de cadastrar produto e voltar com o resultado
          ElevatedButton(
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
          // Add margem
          const SizedBox(height: 16.0),
          // Lista de produtos cadastrados
          Expanded(
            child: ListView(
              children: produtos.map((produto) {
                return Card(
                  elevation: 2.0, // Elevação da carta
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Margem ao redor da carta
                  child: ListTile(
                    title: Text(
                      produto.name,
                      style: const TextStyle(
                        fontWeight:  FontWeight.bold,
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
        ],
      ),
    );
  }
}