// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:urbanstore/model/order.dart';

class OrderDetailDisplayScreen extends StatelessWidget {
  final Order order;

  const OrderDetailDisplayScreen({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注文詳細'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '注文ID: ${order.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('注文日: ${order.orderDate}'),
            Text('合計: ${order.totalAmount}円'),
            Text('ステータス: ${order.status.toString().split('.').last}'),
            const SizedBox(height: 16),
            const Text(
              '商品リスト:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return ListTile(
                    title: Text(item.product.name),
                    subtitle: Text('数量: ${item.quantity} | 単価: ${item.price}円'),
                    trailing: Text('小計: ${item.quantity * (item.price ?? 0)}円'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
