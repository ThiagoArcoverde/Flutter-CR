import 'package:crud01/components/product_input.dart';
import 'package:crud01/model/product.dart';
import 'package:flutter/material.dart';

class FormProduct extends StatefulWidget {
  const FormProduct({super.key});

  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
  final TextEditingController ctrlNome = TextEditingController();
  final TextEditingController ctrlPrice = TextEditingController();
  List<Product> produtos = [];

  // Método para exibir um SnackBar com a mensagem de erro
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar produto")),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ProductInput(
                  controller: ctrlNome,
                  label: 'Nome',
                  hint: 'Informe o nome do produto',
                ),
                ProductInput(
                  controller: ctrlPrice,
                  label: 'Preço',
                  hint: 'Informe o preço do produtor',
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Validação para verificar se algum dos campos não está preenchido
                    if (ctrlNome.text.isEmpty || ctrlPrice.text.isEmpty) {
                      _showErrorSnackBar(
                          'Por favor, preencha todos os campos.');
                      return;
                    }

                    // Validação para verificar se o preço não é um número
                    double price = double.tryParse(ctrlPrice.text) ?? 0;
                    if (price <= 0) {
                      _showErrorSnackBar('Por favor, informe um preço válido.');
                      return;
                    }

                    // Adicionar o produto à lista e voltar para a tela principal
                    Product novoProduto =
                        Product(name: ctrlNome.text, price: price);
                    produtos.add(novoProduto);
                    Navigator.pop(context, novoProduto);
                  },
                  child: const Text("Salvar produto"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
