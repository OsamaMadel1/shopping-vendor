import 'package:app/core/presentation/widgets/card_widget.dart';
import 'package:app/core/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: TextWidget(text: 'control panal'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: [
            CardWidget(
              text: 'Products',
              onTap: () {
                context.push('/productScreen');
              },
            ),
            CardWidget(
              text: 'Orders',
              gradientStart: Colors.orange,
              gradientEnd: Colors.deepOrangeAccent,
              onTap: () {
                context.push('/ordersScreen');
              },
            ),
            CardWidget(
              text: 'Repoters',
              gradientStart: Colors.teal,
              gradientEnd: Colors.greenAccent,
              onTap: () {
                // صفحة الفئات
              },
            ),
            CardWidget(
              text: 'Sales',
              gradientStart: Colors.pink,
              gradientEnd: Colors.redAccent,
              onTap: () {
                // صفحة الإعدادات
              },
            ),
          ],
        ),
      ),
    );
  }
}
